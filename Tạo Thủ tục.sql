CREATE OR REPLACE PROCEDURE
    TAOLUUKY(c_makh luuky.makh%TYPE, c_mack luuky.mack%TYPE, c_soluong luuky.soluong%TYPE)
IS
    c_mack_temp luuky.makh%TYPE;
    c_makh_temp luuky.mack%TYPE;
    c_loi EXCEPTION;
    c_count INTEGER;
BEGIN  
    SELECT makh,mack
    INTO c_makh_temp, c_mack_temp
    FROM luuky
    WHERE makh=c_makh and mack=c_mack;
    
    IF c_makh_temp is not null THEN RAISE c_loi;
    END IF;
    
    EXCEPTION 
        WHEN c_loi THEN dbms_output.put_line('Khong them duoc');
        WHEN no_data_found THEN
            INSERT INTO luuky(makh, mack, soluong)
                VALUES(c_makh, c_mack, c_soluong);
            dbms_output.put_line('MaCK: '||c_mack||'; MaKH: '||c_makh||' da duoc them');
END;



--Tang luy ky--
CREATE OR REPLACE PROCEDURE
    tangluuky(c_makh luuky.makh%TYPE, c_mack luuky.mack%TYPE, c_soluongtang luuky.soluong%TYPE)
IS
    c_mack_temp luuky.makh%TYPE;
    c_makh_temp luuky.mack%TYPE;
    c_soluong_temp luuky.soluong%TYPE;
    c_loi EXCEPTION;
    c_count INTEGER;
BEGIN
    SELECT makh, mack, soluong
    INTO c_makh_temp, c_mack_temp, c_soluong_temp
    FROM luuky 
    WHERE makh=c_makh and mack=c_mack ;
            
    IF c_makh_temp is not null and c_soluongtang>0 THEN
        UPDATE LUUKY
        SET luuky.soluong=c_soluong_temp+c_soluongtang
        WHERE makh=c_makh AND mack=c_mack;
        dbms_output.put_line('Cap nhat thanh cong');
    END IF;
        
    EXCEPTION  
        WHEN no_data_found THEN
            TAOLUUKY(c_makh, c_mack, c_soluongtang) ;   
END;