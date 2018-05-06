from selenium import webdriver
import unittest
import time
import pytest

@pytest.mark.uitest
class TestFormater(unittest.TestCase):
    def test_plain_lowercase(self):
        driver = webdriver.Chrome()
        driver.get("http://127.0.0.1:5000/ui")
        driver.find_element_by_id("powitanie")
        self.valid_hello(driver)
        driver.quit()

    def valid_hello(self, driver):
        powitanie = driver.find_element_by_id('powitanie')
        print(powitanie.text)
        self.assertEqual(powitanie.text, "Witaj swiecie!!!")
