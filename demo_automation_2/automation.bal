import demo_automation_2.enrichuserdata;
import demo_automation_2.getusers;
import ballerina/log;

public function main() returns error? {
    do {
        getusers:UsersResponse usersUsersresponse = check get_users->/users.get();
        enrichuserdata:EnrichedUsersResponse enrichuserdataEnrichedusersresponse = check enrichUserData->/enrich.get(emails = usersUsersresponse.users);
        check emailConnection->sendMessage({
            to: usersUsersresponse.users,
            subject: "devant demo",
            'from: "a.kajendran@gmail.com",
            body: "devant connections demo"
        });
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
