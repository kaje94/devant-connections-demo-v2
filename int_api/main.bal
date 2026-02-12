import ballerina/http;
import ballerina/log;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    
    resource function get test() returns TestResponse {
        log:printInfo("Running api");
        return { success: true };
    }
}
