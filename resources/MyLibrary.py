def get_texts_in_webelements(web_elements):
    """ Fails if list of web elements is empty """
    if not web_elements:
        raise AssertionError("The list is empty")
    else:
        text_values = [str(elem.text) for elem in web_elements]
        return text_values


def webelements_should_contain_text(elements, text):
    """ Fails if list of web elements does not contain text """
    for elem in elements:
        if elem.text == text:
            return
    raise AssertionError("Webelements don't contain text '%s'" % text)


def webelements_should_not_contain_text(elements, text):
    """ Fails if list of web elements doesn't contain text """
    for elem in elements:
        if elem.text == text:
            raise AssertionError("Webelements contain text '%s'" % text)


