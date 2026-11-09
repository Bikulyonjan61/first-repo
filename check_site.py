import sys
import urllib.request
import time
import urllib.error
import socket

if len(sys.argv) < 2:
    print("Usage: python check_site.py <url>")
    sys.exit(1)

def check_url(url):
    if not url.startswith("http://") and not url.startswith("https://"):
        url = "http://" + url

    try:
        start=time.perf_counter()
        with urllib.request.urlopen(url,timeout=5) as response:
            end=time.perf_counter()
            response_time = (end - start)*1000
            print(f"{url} UP {response.getcode()} {response_time:.0f} ms")
            return True

    except urllib.error.HTTPError as e:
        print(f"{url} DOWN HTTP Error {e.code}")
        return False
    
    except urllib.error.URLError as e:
        print(f"{url} DOWN {str(e)}")
        return False

    except (TimeoutError, socket.timeout):
        print(f"{url} DOWN Timeout")
        return False

    except Exception as e:
        print(f"{url} DOWN {str(e)}")
        return False

anydown = False

for url in sys.argv[1:]:
    if not check_url(url):
        anydown = True

if anydown:
    sys.exit(1 if anydown else 0)