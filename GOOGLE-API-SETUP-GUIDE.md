# Google Drive API Setup Guide
## For Wildlife Book Project

This guide will walk you through setting up Google Drive API access so I can read your spreadsheet data and keep the website in sync.

---

## Step 1: Create a Google Cloud Project

### 1.1 Go to Google Cloud Console
1. Open your web browser
2. Go to: https://console.cloud.google.com/
3. Sign in with your Google account (the one that owns the Wildlife-Book folder)

### 1.2 Create a New Project
1. At the top of the page, you'll see a project dropdown (probably says "Select a project")
2. Click on it
3. Click **"New Project"** (button in top right of the popup)
4. **Project name:** Type `wildlife-book-api`
5. **Location:** Leave as default ("No organization")
6. Click **"Create"**
7. Wait a few seconds for the project to be created

### 1.3 Select Your New Project
1. Click the project dropdown again
2. Select `wildlife-book-api` from the list
3. The page will refresh with your new project active

---

## Step 2: Enable the APIs

### 2.1 Open the API Library
1. In the left sidebar, click **"APIs & Services"**
2. Click **"Library"** from the submenu

### 2.2 Enable Google Drive API
1. In the search box, type: `Google Drive API`
2. Click on **"Google Drive API"** in the results
3. Click the **"Enable"** button
4. Wait for it to enable (you'll see a checkmark)

### 2.3 Enable Google Sheets API
1. Go back to the API Library (click "Library" in left sidebar again)
2. In the search box, type: `Google Sheets API`
3. Click on **"Google Sheets API"** in the results
4. Click the **"Enable"** button
5. Wait for it to enable

---

## Step 3: Create a Service Account

### 3.1 Go to Service Accounts
1. In the left sidebar, click **"IAM & Admin"**
2. Click **"Service Accounts"** from the submenu

### 3.2 Create New Service Account
1. Click **"Create Service Account"** (blue button at top)
2. You'll see a form with 3 steps

### 3.3 Step 1: Service Account Details
1. **Service account name:** Type `wildlife-book-access`
2. **Service account ID:** This will auto-fill as `wildlife-book-access`
3. **Description:** Type `API access for wildlife book website`
4. Click **"Create and Continue"**

### 3.4 Step 2: Grant Access (Optional but recommended)
1. **Role:** Click the dropdown
2. Select **"Basic"** → **"Editor"**
   - This lets me read and write files (safer than "Owner")
3. Click **"Continue"**

### 3.5 Step 3: Grant Users Access (Skip this)
1. Leave these fields empty
2. Click **"Done"**

### 3.6 Find Your Service Account Email
1. You should now see `wildlife-book-access` in the list
2. Look for the **Email** column
3. It will look like: `wildlife-book-access@wildlife-book-api.iam.gserviceaccount.com`
4. **Write this down** — you'll need it in Step 5

---

## Step 4: Create the JSON Key File

### 4.1 Select the Service Account
1. Click on `wildlife-book-access` in the service accounts list
2. This opens the service account details page

### 4.2 Go to Keys Section
1. Click the **"Keys"** tab (near the top)
2. You should see "No keys available"

### 4.3 Add a New Key
1. Click **"Add Key"** dropdown
2. Select **"Create new key"**
3. Choose **"JSON"** (should already be selected)
4. Click **"Create"**
5. A JSON file will automatically download to your computer
   - Filename will be something like: `wildlife-book-api-1234567890.json`

### 4.4 Save the Key File
1. Move the downloaded file somewhere safe
2. **Don't rename it** — the name contains important info
3. You'll need to open this file in Step 6

---

## Step 5: Share Your Google Drive Folder

### 5.1 Open Google Drive
1. Go to: https://drive.google.com
2. Sign in with the same Google account

### 5.2 Find Your Wildlife-Book Folder
1. Locate the `Wildlife-Book` folder
2. **Right-click** on it
3. Select **"Share"** from the menu

### 5.3 Add the Service Account
1. In the "Share" dialog, click in the "Add people and groups" box
2. Type the service account email from Step 3.6:
   - `wildlife-book-access@wildlife-book-api.iam.gserviceaccount.com`
3. Press Enter or Tab
4. **Permission:** Make sure it's set to **"Editor"**
   - Click the dropdown next to the email if needed
5. Click **"Send"** or **"Share"**

### 5.4 Verify the Share
1. Right-click the Wildlife-Book folder again
2. Click **"Share"**
3. You should see the service account email in the list with "Editor" access

---

## Step 6: Give Me the Credentials

### 6.1 Open the JSON Key File
1. Find the downloaded JSON file (from Step 4)
2. Open it with a text editor:
   - Windows: Right-click → Open with → Notepad
   - Mac: Right-click → Open with → TextEdit
   - Or use any code editor if you have one

### 6.2 Copy the Contents
1. Select all the text (Ctrl+A or Cmd+A)
2. Copy it (Ctrl+C or Cmd+C)

### 6.3 Send It to Me
1. Paste the entire contents in our chat
2. It will look something like this:
   ```json
   {
     "type": "service_account",
     "project_id": "wildlife-book-api",
     "private_key_id": "...",
     "private_key": "...",
     "client_email": "wildlife-book-access@wildlife-book-api.iam.gserviceaccount.com",
     ...
   }
   ```

**Security Note:** This credential only works for files/folders you explicitly share with it. It's safe to share in our private chat.

---

## What Happens Next?

Once you send me the credentials, I will:

1. **Save the credentials** securely in the workspace
2. **Connect to your Google Drive**
3. **Read the complete subregions data** from your spreadsheet
4. **Update the `animals.json` file** with the real data
5. **Regenerate all region pages** with the correct structure
6. **Push everything to GitHub**

Then you can deploy the updated site with all the correct subregions!

---

## Troubleshooting

### Can't find "APIs & Services"?
- Make sure you're in the right project (check the dropdown at the top)
- Try the hamburger menu (three lines) in the top left

### Downloaded file won't open?
- It's a text file, not a document
- Use Notepad, TextEdit, or any text editor
- Don't double-click it — right-click and "Open with"

### Service account email not working?
- Make sure you copied it exactly
- It should end with `@wildlife-book-api.iam.gserviceaccount.com`
- Don't confuse it with your personal email

### Share button grayed out?
- Make sure you own the folder (not just have access)
- Try refreshing the page

---

Take your time — this is a one-time setup. Once it's done, I can access your Drive data anytime you need!
