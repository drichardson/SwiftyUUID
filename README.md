SwiftyUUID
==========
Native Swift UUIDs. Generates [RFC 4122](https://www.ietf.org/rfc/rfc4122.txt), version 4 randomly generated UUIDs.

Example
-------

    let uuid = SwiftyJSON.UUID()
    let uuidStr = uuid.CanonicalString()
    

Why not use NSUUID?
------------------
Getting the raw UUID bytes out of NSUUID is painful and error prone.
