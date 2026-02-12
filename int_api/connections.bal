import int_api.enrichusersv2;
import int_api.getusers1;

import ballerina/email;

final getusers1:Client get_users1 = check new (apiKeyConfig = {choreoAPIKey: ChoreoAPIKey}, config = {proxy: devantProxyConfig, timeout: 60}, serviceUrl = getSanitizeUrl(ServiceURL));
final enrichusersv2:Client enrichUsersv2 = check new (serviceUrl = string `${ServiceURL1}`);
final email:SmtpClient emailConnection1 = check new (string `${smtpHost1}`, string `${smtpUserName1}`, string `${smtpPassword1}`, port = 465, security = "SSL");

function getSanitizeUrl(string url) returns string {
    string cleaned = url;
    
    // Loop ensures we remove multiple slashes if they exist (e.g., "api.com//")
    while cleaned.endsWith("/") {
        cleaned = cleaned.substring(0, cleaned.length() - 1);
    }
    
    return cleaned;
}