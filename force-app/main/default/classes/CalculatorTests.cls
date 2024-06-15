@IsTest
public class CalculatorTests {
    @IsTest
    static void testDivideByZero(){
        Integer a = 2;
        Integer b = 0;
        try{
            Test.startTest();
            Calculator.divide(a, b);
            Test.stopTest();
            Assert.fail('You still can\'t divide by zero');
        }catch (Calculator.CalculatorException e){
            Assert.isTrue(
                e.getMessage().equalsIgnoreCase('You still can\'t divide by zero'),
                'Exception message doesn\'t match ' + e.getMessage()
            );
        }        
    }
}