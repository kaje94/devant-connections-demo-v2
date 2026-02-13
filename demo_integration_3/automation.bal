import demo_integration_3.getusers;
import demo_integration_3.userenrichersvc;

import ballerina/log;

public function main() returns error? {
    do {
        getusers:UsersResponse usersUsersresponse = check get_users->/users.get();
        log:printInfo("usersUsersresponse: " + usersUsersresponse.toString());
        userenrichersvc:EnrichedUsersResponse userenrichersvcEnrichedusersresponse = check userEnricherSvc->/enrich.get(emails = usersUsersresponse.users);
        log:printInfo("userenrichersvcEnrichedusersresponse: " + userenrichersvcEnrichedusersresponse.toString());
        check emailConnection->sendMessage({
            to: usersUsersresponse.users,
            subject: "devant connections",
            'from: "a.kajendran@gmail.com",
            body: "devant connections demo"
        });
        log:printInfo("Email sent successfully");
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
