import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    
    resource function get users() returns UsersResponse {
        return {
            users: ["kajendran@wso2.com"]
        };
    }
}
