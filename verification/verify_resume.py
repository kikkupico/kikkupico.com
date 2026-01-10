
from playwright.sync_api import sync_playwright
import os

def verify_resume_page():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        cwd = os.getcwd()
        resume_url = f"file://{cwd}/_site/resume.html"
        about_url = f"file://{cwd}/_site/about.html"

        # Verify Resume HTML
        print(f"Navigating to {resume_url}...")
        page.goto(resume_url)
        page.screenshot(path="verification/resume_html.png")
        print("Resume HTML screenshot taken.")

        # Verify About Page
        print(f"Navigating to {about_url}...")
        page.goto(about_url)
        page.screenshot(path="verification/about_page.png")
        print("About page screenshot taken.")

        browser.close()

if __name__ == "__main__":
    verify_resume_page()
