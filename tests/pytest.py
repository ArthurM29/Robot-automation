from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
import time


driver = webdriver.Firefox()
driver.maximize_window()
driver.get("http://automationpractice.com/index.php")
wait = WebDriverWait(driver, 10)

# add to cart
# driver.find_element_by_xpath(".//*[@id='homefeatured']/li[2]/div/div[2]/div[2]/a[1]/span").click()
# # close 'Add to cart' window
# wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, ".cross"))).click()
#
# shopping_cart = driver.find_element_by_css_selector(".shopping_cart>a")
#
# hover = ActionChains(driver).move_to_element(shopping_cart)
# hover.perform()
#
# products_in_cart = driver.find_elements_by_xpath("//div[@class='product-name']//a")
# texts = MyLibrary.get_text_in_webelements(products_in_cart)
# print texts

# go to Sign In page
driver.find_element_by_css_selector(".login").click()

# enter credentials and sign in
driver.find_element_by_id("email").send_keys("arthur.m1199@gmail.com")
driver.find_element_by_id("passwd").send_keys("ArtPass123!")
driver.find_element_by_css_selector("#SubmitLogin").click()

# go to Home Page
driver.find_element_by_css_selector(".logo.img-responsive").click()

# go to Product Details
driver.find_element_by_css_selector(".replace-2x.img-responsive").click()

# add product to Shopping Cart
driver.find_element_by_name("Submit").click()

# Proceed to checkout
wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, ".btn.btn-default.button.button-medium>span"))).click()

# go to Order Address
wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, ".button.btn.btn-default.standard-checkout.button-medium>span"))).click()

# click Proceed to Checkout on Order Address
#elem = driver.find_element_by_xpath(".//*[@id='center_column']/form/p/button//i").click()
driver.find_element_by_css_selector(".button.btn.btn-default.button-medium").click()
# wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, ".button.btn.btn-default.button-medium"))).click()
# print ("is displayed: " + str(elem.is_displayed()))
# print ("is enabled: " + str(elem.is_enabled()))





time.sleep(2)
driver.close()
