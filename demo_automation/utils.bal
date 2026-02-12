# Removes all trailing slashes from the end of a string without using regex.
# + url - The original URL string
# + return - The cleaned URL
function getSanitizeUrl(string url) returns string {
    string cleaned = url;
    
    // Loop ensures we remove multiple slashes if they exist (e.g., "api.com//")
    while cleaned.endsWith("/") {
        cleaned = cleaned.substring(0, cleaned.length() - 1);
    }
    
    return cleaned;
}