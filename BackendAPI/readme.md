## Why use REST over SOAP?

Overall REST is more flexible as we are allowed to use different formats (we mostly use it with JSON) in contrast to SOAP that only allows XML. Neither of them is better; it depends on its case of use as when you search over the internet. For example SOAP is mostly used in the areas where you have to transfer huge amounts of data in XML with standards such as in the Finance industry, Insurance, SAT (In Mexico), etc.

## Differences

| SOAP                                 | REST                                       |
| ------------------------------------ | ------------------------------------------ |
| SOAP is a protocol                   | REST is an architectural pattern           |
| Requires more bandwidth              | REST is more flexible                      |
| Can only work with XML               | Can work with Plain text, HTML, JSON, etc. |
| Transfer over HTTP, SMTPF, FTP, etc. | Transfer over HTTP                         |
| Cannot be cached                     | Can be cached                              |

We did had the curiosity to quickly investigate about SOAP and if it could be an option for us in this project, but we agreed that there was no way or good reason to do it.

With that being said for our case again, it only made sense to use REST as we are not handling complex information, we could archive better performance for our application and it was easier for us to handle JSON formats.
