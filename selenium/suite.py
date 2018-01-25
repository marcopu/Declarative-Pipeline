import unittest
import HTMLTestRunner

from selenium import webdriver
from pyvirtualdisplay import Display

class MozillaTesting(unittest.TestCase):

    display = Display(visible=0, size=(1366, 768))
    display.start()

    def setUp(page):
        page.driver = webdriver.Firefox()

    def test_openMozilla(page):
        driver = page.driver
        driver.get("http://192.168.110.40:8080/app/tickets")
        page.assertIn("Consoft", driver.title)

    def test_insertTicketMozilla(page):
        driver = page.driver
        driver.get("http://192.168.110.40:8080/app/tickets")
        inputElement = page.driver.find_element_by_link_text("Crea il tuo Ticket")
        inputElement.click()

    def tearDown(page):
        page.driver.close()
		
class ChromeTesting(unittest.TestCase):

    def setUp(page):
        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        options.add_argument('window-size=1366x768')
        options.add_argument('no-sandbox')
        page.driver = webdriver.Chrome(chrome_options=options)

    def test_openChrome(page):
        driver = page.driver
        driver.get("http://192.168.110.40:8080/app/tickets")
        page.assertIn("Consoft", driver.title)

    def test_insertTicketChrome(page):
        driver = page.driver
        driver.get("http://192.168.110.40:8080/app/tickets")
        inputElement = page.driver.find_element_by_link_text("Crea il tuo Ticket")
        inputElement.click()

    def tearDown(page):
        page.driver.close()

suite = unittest.TestSuite()
suite.addTests([
	unittest.defaultTestLoader.loadTestsFromTestCase(MozillaTesting),
	unittest.defaultTestLoader.loadTestsFromTestCase(ChromeTesting)
	])

runner = HTMLTestRunner.HTMLTestRunner(
            title='Functional Tests',
            description='Report'
            )


runner.run(suite)
