import ballerina/log;

public function main() returns error? {
    do {
        log:printInfo("Starting automation task...");
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
