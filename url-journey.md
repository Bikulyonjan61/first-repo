#What happens when you type a URL

##my notes
1. If __name__== "__main__"
   Suppose, In a file a function name is used to print name of the user and you need to borrow these code in another script so you import name from the file but when you run it the function runs itself even if you dont call it so to prevent it if __name__=="__main__" is used it tells whether the script in main file or the imported function in a script. The name is a variable declared by python and changes for every file.

2. sys.argv
   When you run a file in terminal the elements or content after the file name can be used in the program. Suppose python code.py first. the first can be printed in the code using print(sys.argv[1]). Sys.argv[0] is the name of the file code.py and sys.argv[1] is the word after it.

When you type a URL in the browser the following things happen:

## 1. The browser reads the address
Suppose you want to visit https://www.google.com/. The browser breaks down the down in parts i.e  
Domain, protocol and path. The https is a protocol Hypertext Transfer Protocol Secure it is a widely used protocol other than http which is less secure version of it. Than the domain I.e www.google.com  and the path i.e the part after the / which can be used to visit pages of the website. Than a DNS request is send.

## 2. DNS finds the IP address
The DNS server is like a phone book of the internet where it holds the ip address and its domain name for the websites. The browsers sends the request to the DNS server the server first searches the domain name in the cache. The cache holds the recently used domain names. If not found it searches the server and than the domain revenant ip address is found.

## 3. Connecting to the server
A computer uses various program on the internet like emails, ssh etc so if the ip address is the address of the computer the ports are the home number, In computer port 443 is used for HTTPS and port 80 is used for HTTP. There is no reason the way it is assigned it is just aggreed and assigned. The TCP helps to transfer data through internet it is a protocol which transfers data over the internet in packets or chunks.

## 4. Encryption (TLS)
HTTPS is the encrypted version of HTTP , IN HTTP it sends data over the internet in plain text which can be read by anyone but HTTPS wrapps the HTTP data into TLS which encrypts it using various method of cryptography

## 5. The HTTP request
When you click at a link or a bottom on a website the http request is send to the server which contains path, header, get is usually send to get data such as images from the server while the path specifies the page requested by the user. Header contains the key information such as browser data, OS etc

## 6. The response
The server than sends a response. We often see errors such as error 404 500 etc, every error has a code and they all are differenet error 404 refers to page doesn't exist while error 500 shows internal server error

## 7. The browser shows the page
The browser uses the headers data and shows the page

##what I saw in the terminal
When dig www.google.com is entered into the terminal it shows
;; ANSWER SECTION:
google.com.		240	IN	A	142.251.223.238

Google.com is the name the user asked about
240 is the seconds the answer can be cached
IN is the internet class
A tells us is ip v4
142.251.223.238 is the ip address of the building

When curl -v google.com it shows the TCL,TSL and HTTPS step
* IPv4: 142.251.222.164
*   Trying 142.251.222.164:80...
* Connected to googl.com (142.251.222.164) port 80

Here as we can see the ip that we get in cmd dig is the same in curl as well and it shows it is connected to it by using port 80 that is HTTP

(304) (OUT), TLS handshake, Client hello (1):
*  CAfile: /etc/ssl/cert.pem
*  CApath: none
* (304) (IN), TLS handshake, Server hello (2):
* (304) (IN), TLS handshake, Unknown (8):
* (304) (IN), TLS handshake, Certificate (11):
* (304) (IN), TLS handshake, CERT verify (15):
* (304) (IN), TLS handshake, Finished (20):
* (304) (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / AEAD-CHACHA20-POLY1305-SHA256 / [blank] / UNDEF

Here TLS is used to encrypt the data and we can see the TLS handshake is done and finished

 Server certificate:
*  subject: CN=example.com
*  start date: Sep 26 22:49:11 2026 GMT
*  expire date: Dec 25 22:56:35 2026 GMT
*  subjectAltName: host "example.com" matched cert's "example.com"
*  issuer: C=US; O=SSL Corporation; CN=Cloudflare TLS Issuing ECC CA 3
*  SSL certificate verify ok.

Here the browser checks that it was issued by a trusted authority 

