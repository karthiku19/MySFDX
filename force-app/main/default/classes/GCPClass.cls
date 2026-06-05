public class GCPClass {
    

public String get_access_token(){
 
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    HttpResponse res = new HttpResponse();
    req.setEndpoint('https://oauth2.googleapis.com/token');
    req.setMethod('POST');
    
    req.setHeader('ContentType','application/x-www-form-urlencoded');
    
    String header = '{"alg":"RS256","typ":"JWT"}';
    String header_encoded = EncodingUtil.base64Encode(blob.valueof(header));
    
    String claim_set = '{"iss":"de-nc-sa-apims-sf-exchange@sky-newcrm-non-prod-256009.iam.gserviceaccount.com"';
    claim_set += ',"scope":"https://www.googleapis.com/robot/v1/metadata/x509/de-nc-sa-apims-sf-exchange%40sky-newcrm-non-prod-256009.iam.gserviceaccount.com"';
    claim_set += ',"aud":"https://oauth2.googleapis.com/token"';
    claim_set += ',"exp":"' + datetime.now().addHours(1).getTime()/1000;
    claim_set += '","iat":"' + datetime.now().getTime()/1000 + '"}';
    
    String claim_set_encoded = EncodingUtil.base64Encode(blob.valueof(claim_set));
    
    String signature_encoded = header_encoded + '.' + claim_set_encoded;
    
    String key = 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCjJ7K1bTIq9QPKLmPsUrmgSV4ZS3WM4Rp24YJUyJlGfnzgyqSK0SyFn9jxEEtuPJ6r13wTmnYE+0kojTtRrqKSaFP+R1s3hE6l98X1KguF00tkMbHOD/0C2Tazj8J/OKrlciAaAm5EPqnUhQMPAmmtrKRHxAyTG0AcZWUyGsomDCruspDhtfpcf8H93Gioqol2oeEynZ6DtdnCE3tWaoQvFVAYRa77uo5DjGThWZajZNBmM9xBjeh84hgvd/UoIfjOj3aVg3E9TWU1TqXjCmWyOBXlVTxnqdCJab9pOP20tQy9oVf0PndfUrQ0QLY/a809xkbWojLGUXiofGyRvv8dAgMBAAECggEAEEknZcQ5WH/eCbmxODb2t/jy12AIoxAaKekvLwLaB+ca1H5tx7yC7vCqgT+Q4/dRmFIZXMSTiMJDhnR4ihn+ONKIpc5eHM/MYPU3UZZJkalqcl0ihDDk3rqrYueT8MqJhn8qlKYO9ylxHtlLGZ2ySkd8G3zGi42SC/OUExkI+hyecOg+BMKzVvO0zEvBhZewsE9kRNKxXkla1JKCJlR3rp1hCecP7YH3Ijzvrsg6RLHxSacS9vrYOCTFP6EX5eavhaabteMK1Q9RxaZB15Xs5nWsFU6i4IztsDvyoOw0nv+qFmF9rHpTWSX5mChI7aWzOi9L2Jjd5M/xr2gaw0PVgQKBgQDZTO3S+CjshVudKCvWrZU/iudtrhgLkJhBYPkOJAeF2f2F4Hx2gxzh0VG6o4sV8svw2XNWa+i4OGlDzIRjJZ5+u4fPQ1YLhUzObJWgF/UBcr5OYIiQ4VHMbhFKTp3qBaqTnXGXaEFxycvBGZcTv18ToDzn0GQEmD/7myqaDvs/nQKBgQDANjGdDM+vLkyHh1pE2uXFHL/WuMunedK4DP4a3eS1wazwuUso0KuAbtJjQ8SooNt6jYzGNOcwU53xJMPdp5WMtUp1obmw99AcBjWxFfHecjCHrvT9WFmre7IyA9izRV60QRq0wlgwhiobM2ZK+LZLXKcZ+lkLtNH8LqjbmsdlgQKBgQC1vxATKhggaxHLCjRQY/K2qNkT9U6LLa8Kz66/Uwcvvrm65Z10Cgl4Hfi7n9nOy7ojgdxj5fFJU3VHjaEUw/wih3r5sZogHKe25z7mHeOACJZ/O2I9uxcNYun3OnX9rCuVN1QwjLRgFaXjpiGkFKXS5mzKfpOI/EZXjNo+7FTcSQKBgGJBEbmDXALjuvEoyocaEoxhNttvWYOB7apx0c8wEIKsv1fKkFYL3S9o9xkRAk1k9Oy/wO9tCaUViU5Eie8bhIIKBkb9ZevFsdcxgW7Flf8tBgvF7qw25peXQq74cmSpmFCyWxF9qxEa9Bk1fBvk6WK6uRy5cZ1fUFwGCgFALJ+BAoGAewYw0Kt0BO+/Ljc2BEinZ+JGtyc878PU5+iqRDXBAtZuy2DsePPv8QPZXoOQF7f/GCKGzAG28x/IRGqf23HVWRH1tBMiPLj0zBUQ/zP67acwjmBzB1L48uy7TYV+lwo3ZZx7R40s1jimiRxRHx0zzZks9+Q91DtyAzh=';
    
    blob private_key = EncodingUtil.base64Decode(key);
    system.debug('keymine='+private_key);
    signature_encoded = signature_encoded.replaceAll('=','');
    String signature_encoded_url = EncodingUtil.urlEncode(signature_encoded,'UTF-8');
    blob signature_blob =   blob.valueof(signature_encoded_url);
    System.debug('Signation =' + signature_blob );
    
    String signature_blob_string = EncodingUtil.base64Encode(Crypto.sign('RSA-SHA256', signature_blob, private_key));
    
    String JWT = signature_encoded + '.' + signature_blob_string;
    
    JWT = JWT.replaceAll('=','');
    
    String grant_string= 'urn:ietf:params:oauth:grant-type:jwt-bearer';
    req.setBody('grant_type=' + EncodingUtil.urlEncode(grant_string, 'UTF-8') + '&assertion=' + EncodingUtil.urlEncode(JWT, 'UTF-8'));
    res = h.send(req);
    String response_debug = res.getBody() +' '+ res.getStatusCode();
    System.debug('Response =' + response_debug );
    if(res.getStatusCode() == 200) {
        JSONParser parser = JSON.createParser(res.getBody());
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'access_token')) {
                // Move to the value.
                parser.nextToken();
                // Return the access_token
                system.debug(parser.getText());
                return parser.getText();
            }
        }
    }
    system.debug('Error');
   return 'error';
}
}