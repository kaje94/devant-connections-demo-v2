import demo_automation.enrichusers;
import demo_automation.getusers;

import ballerina/log;

public function main() returns error? {
    do {
        log:printInfo("Starting automation task...");
        getusers:UsersResponse usersUsersresponse = check get_users->/users.get();
        log:printInfo("got response from getusers service, response = " + usersUsersresponse.toString());
        enrichusers:EnrichedUsersResponse enrichusersEnrichedusersresponse = check enrichusersConnection->/enrich.get(emails = [usersUsersresponse.users[0]]);
        log:printInfo("got response from enrichusers service, response = " + enrichusersEnrichedusersresponse.toString());
        check emailConnection->sendMessage({
            to: usersUsersresponse.users,
            'from: emailFrom, 
            subject: emailSubject,
            body: emailBody
        });

    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
