import demo_automation_2.enrichuserdata;
import demo_automation_2.getusers;

import ballerina/email;

final getusers:Client get_users = check new (apiKeyConfig = {choreoAPIKey: ChoreoAPIKey}, config = {proxy: devantProxyConfig, timeout: 60}, serviceUrl = ServiceURL);
final enrichuserdata:Client enrichUserData = check new (serviceUrl = string `${ServiceURL1}`);
final email:SmtpClient emailConnection = check new (string `${smtpHost}`, string `${smtpUserName}`, string `${smtpPassword}`, port = 465, security = "SSL");
