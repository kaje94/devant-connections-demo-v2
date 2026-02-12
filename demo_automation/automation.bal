import demo_automation.enrichusers;
import demo_automation.getusers;

import ballerina/log;

public function main() returns error? {
    do {
        log:printInfo("Starting automation task...");
        getusers:UsersResponse usersUsersresponse = check get_users->/users.get();
        enrichusers:EnrichedUsersResponse enrichusersEnrichedusersresponse = check enrichusersConnection->/enrich.get(emails = [usersUsersresponse.users[0]]);
        check emailConnection->sendMessage({
            to: usersUsersresponse.users,
            'from: "a.kajendran@gmail.com", 
            subject: "hellow",
            body: "email body"
        });

    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
