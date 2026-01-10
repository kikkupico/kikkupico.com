
from playwright.sync_api import sync_playwright
import os

def run():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        # Load the resume html file from the build output
        # Assuming the build output is in _site/resume.html
        file_path = os.path.abspath("_site/resume.html")
        page.goto(f"file://{file_path}")

        # Wait for the page to load
        page.wait_for_load_state("networkidle")

        # Screenshot the whole page to verify layout
        page.screenshot(path="verification/resume_screenshot.png", full_page=True)

        # Also screenshot the "About" page to check links
        file_path_about = os.path.abspath("_site/about.html")
        page.goto(f"file://{file_path_about}")
        page.screenshot(path="verification/about_screenshot.png")

        browser.close()

if __name__ == "__main__":
    run()
