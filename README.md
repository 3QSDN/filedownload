# 3Q SDN Filedownload Examples

## Download via CURL

1. Get Download URI from the API

    `GET https://sdn.3qsdn.com/api/v2/projects/{ProjectId}/files/{FileId}/output`

    with the Header `X-AUTH-APIKEY` for authentication.

2. If [Content Distribution Protection](https://docs.3q.video/de/Erweiterungen_&_Plugins/Content-Absicherung%20/index.html#page_Beispiel-Schlusselerzeugung-2) enabled, generate `[HASH]` and `[TimeStamp]`

    Get SecurityKey from API
    
    `GET https://sdn.3qsdn.com/api/v2/projects/{ProjectId}`
    
    PHP Code:
    
    ```PHP
    $expires = time() + 216000;
    $_user_agent = 'sdn-downloader';
    $hash = md5($expires.SecurityKey.$_user_agent, false);
    $DOWNLOAD_URI = str_replace(array("[HASH]", "[TimeStamp]"), array($hash, $expires), $URI);
    ```
    
    *Note: the user_agent above and in download.sh script curl command must be the same.*
    
3. Call download.sh

    `download.sh DOWNLOAD_URI DST_FILENAME`

