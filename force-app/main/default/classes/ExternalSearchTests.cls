@IsTest
public class ExternalSearchTests {
    @IsTest
    static void testPositivieMocking(){
        // GIVEN
        HTTPMockFactory mock = new HTTPMockFactory(
            200,
            'OK',
            'I found it!',
            new Map<String, String>()
        );

        Test.setMock(HttpCalloutMock.class, mock);

        // WHEN
        Test.startTest();
            String result = ExternalSearch.googleIt('epic search');
        Test.stopTest();

        // THEN
        Assert.areEqual('I found it!',result,'Expected to receive mock response');
    }

    @IsTest
    static void testNegativeMocking(){
        // GIVEN
        HTTPMockFactory mock = new HTTPMockFactory(
            500,
            'ERROR',
            'I can\'t found it!',
            new Map<String, String>()
        );

        Test.setMock(HttpCalloutMock.class, mock);

        // WHEN
        Test.startTest();
            String result = ExternalSearch.googleIt('sdfdsfdfsdfsd');
        Test.stopTest();

        // THEN
        Assert.areEqual('Can\t found it!',result,'Expected to receive mock response');
    }
}