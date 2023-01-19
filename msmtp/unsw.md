links: 
https://github.com/getmail6/getmail6
https://github.com/getmail6/getmail6/blob/master/docs/getmailrc-examples
https://superuser.com/questions/1723180/how-to-continue-using-msmtp-oauth-2-0-for-gmail-in-mutt-after-oob-deprecation

#
# Example 13: Microsoft Office 365 xoauth2 example
# To initialize do:
#
# Step1: Create App Registration in Azure
#
# In a browser, open https://portal.azure.com
# Select "Manage Azure Active Directory" (use the search if needed)
# Select "App Registrations"
# Select "New Registration"
# Enter a project name, eg "getmail".
# Select "Accounts in this organizational directory only (Single tenant)" from "Supported account types"
# Select type "Web" and enter "http://localhost:8083" for "Redirect URI"
# Select "Register"
#
# Now, from the new App's details page, make a note of:
# * client_id
# * tenant_id
# (These are in the "Essentials" section.)
#
# Next create a secret by selecting "Certificates and secrets"
# Select "New client secret"
# * Description: password
# * Expires: select preferred expiry date
# Make a note of:
# * client_secret
# It is available by selecting "Value".
#
# Next add permissions:
#
# Select "API permissions", then "Add a permission".
# Select "Microsoft Graph"
# Select "Delegated permissions"
# Search and select the following permissions:
# * IMAP.AccessAsUser.All
# * POP.AccessAsUser.All
# * SMTP.Send
# * offline_access
# Select "Add permissions"

# Step 2: Add the new credentials to the microsoft.json template
#
# {"scope": "https://outlook.office365.com/IMAP.AccessAsUser.All https://outlook.office365.com/POP.AccessAsUser.All https://outlook.office365.com/SMTP.Send offline_access",
#  "user": "firstname.lastname@example.com",
#  "client_id": "<client_id>",
#  "client_secret": "<secret>",
#  "token_uri": "https://login.microsoftonline.com/<tenant_id>/oauth2/v2.0/token",
#  "auth_uri": "https://login.microsoftonline.com/<tenant_id>/oauth2/v2.0/authorize",
#  "redirect_uri": "http://localhost"}
#
# Step 3: excecute:
#
#    getmail-gmail-xoauth-tokens --init /path-to-your-users-getmail-directory/microsoft.json
#
# This will give you a URL you need to open in a browser.
# Opening this URL will generate a HTTP-redirect that connects back and updates the json file.
# Note: The script starts a local HTTP-server listening on http://localhost:8083.
# If you connect from a remote machine, you will need to forward that port to your local
# machine, so that the server can be reached via localhost:8083 on the machine running the browser.
# (You only need to do this once.)
#
# getmail-gmail-xoauth-tokens is waiting for the reconnect with the URL that contains the verification code.
# Once it received the callback
#
# getmail-gmail-xoauth-tokens will update the microsoft.json file. The json file
# will now contain the required tokens.
#
# Step 4: Update the `[retriever] `section of the rc file.

[retriever]
type = SimpleIMAPSSLRetriever
use_xoauth2 = True
server = outlook.office365.com
username = firstname.lastname@example.com
password_command = ("getmail-gmail-xoauth-tokens", "/path-to-your-users-getmail-directory/microsoft.json")


