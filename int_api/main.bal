import int_api.enrichusersv2;
import int_api.getusers1;

import ballerina/http;
import ballerina/log;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {

    resource function get test() returns TestResponse|error {
        log:printInfo("Running api");
        getusers1:UsersResponse users1Usersresponse = check get_users1->/users.get();
        enrichusersv2:EnrichedUsersResponse enrichusersv2Enrichedusersresponse = check enrichUsersv2->/enrich.get(emails = users1Usersresponse.users);
        check emailConnection1->sendMessage({
            to: users1Usersresponse.users,
            subject: "from demo",
            'from: "a.kajendran@gmail.com",
            body: "hello devant users!"
        });
        return {success: true};
    }
}
