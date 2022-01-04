CREATE TABLE zava_order(
oid VARCHAR2(100) CONSTRAINT zava_oid_pk PRIMARY KEY,
pid VARCHAR2(100),
odate DATE DEFAULT SYSDATE,
ostatus NUMBER,
payment NUMBER,
address VARCHAR2(999) NOT NULL,
oname VARCHAR2(100) NOT NULL,
ophone VARCHAR2(15) NOT NULL,
);







ALTER TABLE zava_order ADD CONSTRAINT zava_pid_fk FOREIGN KEY(pid) REFERENCES zava_product(pid);

