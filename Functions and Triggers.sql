CREATE FUNCTION Check_Admin_Relationship(
  existing_admin_username IN VARCHAR2,
  new_admin_username IN VARCHAR2
) RETURN VARCHAR2 AS
  admin_relationship VARCHAR2(50);
BEGIN
  SELECT parent_admin
  INTO admin_relationship
  FROM ADMINN
  WHERE username = new_admin_username;

  IF admin_relationship = existing_admin_username THEN
    RETURN 'The new admin was added by the existing admin.';
  ELSE
    RETURN 'The new admin was not added by the existing admin.';
  END IF;
END;
/

  CREATE FUNCTION calculate_total_price(username IN VARCHAR2) RETURN INTEGER AS
  total_price INTEGER;
BEGIN
  SELECT SUM(price) INTO total_price
  FROM ticket
  WHERE userUsername = username;

  RETURN total_price;
END;
/
Procedures 

CREATE PROCEDURE UpdateTicketPrice (
    ticketID IN VARCHAR2,
    newPrice IN INTEGER
)
IS
BEGIN
    UPDATE ticket
    SET price = newPrice
    WHERE id = ticketID;
    
    COMMIT; --register data 
END;
/


Triggers 

CREATE TRIGGER check_TicketPrice1
BEFORE INSERT OR UPDATE ON ticket
FOR EACH ROW
BEGIN
  IF :new.price < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Ticket price cannot be negative');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER preventPartyDeletion BEFORE DELETE ON party FOR EACH ROW
DECLARE v_cnt NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cnt FROM ticket WHERE eventName = :old.Partyname;
     IF v_cnt > 0 THEN RAISE_APPLICATION_ERROR (-2003, 'Cannot delete party with associated tickets');
    END IF;
END;
/
CREATE FUNCTION howManyPArtyAttended(username IN VARCHAR2) RETURN INTEGER AS
  attendance_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO attendance_count
  FROM User1Party
  WHERE Userusername = username;

  RETURN attendance_count;
END;
/
CREATE  TRIGGER checkEmail BEFORE INSERT ON user1 FOR EACH ROW BEGIN
    IF INSTR(:new.email, '@') = 0 THEN 
        RAISE_APPLICATION_ERROR(-2001, 'Email must contain "@" symbol');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER Check_Party_Date
BEFORE INSERT ON Party
FOR EACH ROW
DECLARE
    current_date DATE := SYSDATE;
BEGIN
    IF :NEW.p_date < current_date THEN
        RAISE_APPLICATION_ERROR (-2004, 'Party date cannot be older than the current date');
    END IF;
END;
/


CREATE OR REPLACE TRIGGER check_event_party_match
BEFORE INSERT OR UPDATE ON ticket
FOR EACH ROW
DECLARE
    v_partyname party.partyname%TYPE;
BEGIN
    -- Retrieve the party name from the party table
    SELECT partyname INTO v_partyname
    FROM party
    WHERE partyname = :NEW.eventName;
    
    -- Check if the party name exists
    IF v_partyname IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid event name. Event does not match any party.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER UserNameTicket BEFORE INSERT OR UPDATE ON ticket FOR EACH ROW
DECLARE U_Username user1.username%TYPE;
BEGIN
  SELECT username INTO U_Username FROM user1 WHERE username = :new.userUsername;
IF U_Username IS NULL THEN
    RAISE_APPLICATION_ERROR(-20000, 'Invalid username.');
  END IF;
END;
/
