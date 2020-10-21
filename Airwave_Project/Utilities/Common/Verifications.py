from selenium.webdriver.support.expected_conditions import _find_element

__author__  = "Chinmay Bhawe ( chinmay.bhawe@hpe.com)"

class Verifications():
    """Library with keywords related to verifications and assertion actions, which require some logic beyond in built library keywords.
    """
    #Can restrict library scope if needed.
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
    row_class = "row"
    class_attribute = "class"
    div_tag = "div"
    error_tag = "error"
    span_tag = "span"
        
    def verify_values_within_x_percent_limit(self, actual_value, expected_value, percent_range = 5):
        """Method to verify whether two values are within a certain percent range within each other. Default percent range is 5. 
        Returns true if the actual value is within 5% of expected value. Else returns false. 
        """
        #taking care of weird inputs for percent range
        percent_range = abs(int(percent_range))
       
        lower_limit = int(expected_value) - (int(expected_value)*(percent_range/100.0))
        upper_limit = int(expected_value) + (int(expected_value)*(percent_range/100.0))
        if (lower_limit <= int(actual_value) <= upper_limit):
            
            print "Actual Value : " + actual_value + " is within " + str(percent_range) + "% of Expected Value : " + expected_value
            return True
        else:
            print "Actual Value : " + actual_value + " is not within " + str(percent_range) + "% of Expected Value : " + expected_value
            return False
    
    
    
    
    