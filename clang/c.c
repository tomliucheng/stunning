c

 int gethostbyname_r(const char *name,
               struct hostent *ret, char *buf, size_t buflen,
               struct hostent **result, int *h_errnop);