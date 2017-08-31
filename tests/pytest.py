from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
import MyLibrary

driver = webdriver.Chrome()
driver.get("http://automationpractice.com/index.php")
wait = WebDriverWait(driver, 10)

# add to cart
driver.find_element_by_xpath(".//*[@id='homefeatured']/li[2]/div/div[2]/div[2]/a[1]/span").click()
# close 'Add to cart' window
wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, ".cross"))).click()

shopping_cart = driver.find_element_by_css_selector(".shopping_cart>a")

hover = ActionChains(driver).move_to_element(shopping_cart)
hover.perform()

products_in_cart = driver.find_elements_by_xpath("//div[@class='product-name']//a")
texts = MyLibrary.get_text_in_webelements(products_in_cart)
print texts

if 'Blouse' in texts:
    print True
else:
    print False






#driver.close()
