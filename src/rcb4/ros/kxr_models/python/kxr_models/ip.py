import socket


def get_local_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.settimeout(2)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
    except (socket.timeout, OSError):
        ip = socket.gethostbyname(socket.gethostname())
    if ip is None:
        return "localhost"
    return ip
