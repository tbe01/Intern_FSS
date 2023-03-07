/*Tao L?u ký*/
CREATE OR REPLACE PROCEDURE
    TAOLUUKY(c_makh luuky.makh%TYPE, c_mack luuky.mack%TYPE, c_soluong luuky.soluong%TYPE)
IS
    c_mack_temp luuky.makh%TYPE;
    c_makh_temp luuky.mack%TYPE;
    c_loi EXCEPTION;
    c_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO c_count
    FROM khachhang 
    WHERE makh=c_makh;

    IF c_count>0 and c_soluong>0 THEN
        SELECT COUNT(*)
        INTO c_count
        FROM chungkhoan 
        WHERE mack=c_mack;
        IF c_count>0 THEN     
            SELECT makh,mack
            INTO c_makh_temp, c_mack_temp
            FROM luuky
            WHERE makh=c_makh and mack=c_mack;
    
            IF c_makh_temp is not null 
                THEN RAISE c_loi;
            END IF;
        ELSE
            RAISE c_loi;
        END IF;
    ELSE
        RAISE c_loi;
    END IF;
    
    EXCEPTION 
        WHEN c_loi THEN dbms_output.put_line('Khong them duoc');
        WHEN no_data_found THEN
            INSERT INTO luuky(makh, mack, soluong)
                VALUES(c_makh, c_mack, c_soluong);
            dbms_output.put_line('MaCK: '||c_mack||'; MaKH: '||c_makh||' da duoc them');
END;

SET serveroutput ON
EXECUTE taoluuky('KH01', 'VIC',2);

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
    SELECT COUNT(*)
    INTO c_count
    FROM khachhang 
    WHERE makh=c_makh;
    
    IF c_count>0 and c_soluongtang>0 THEN
        SELECT COUNT(*)
        INTO c_count
        FROM chungkhoan 
        WHERE mack=c_mack;
        IF c_count>0 THEN 
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
        ELSE 
            RAISE c_loi;
        END IF;
    ELSE
        RAISE c_loi;
    END IF;
        
    EXCEPTION  
        WHEN no_data_found THEN
            TAOLUUKY(c_makh, c_mack, c_soluongtang) ;   
        WHEN c_loi THEN
            dbms_output.put_line('Dau vao khong hop len');
END;



SET serveroutput ON
EXECUTE tangluuky('KH01', 'VIC',12);


--Ban Chung khoan lo le--

CREATE OR REPLACE PROCEDURE gdck_le(c_kh1 khachhang.makh%TYPE, c_kh2 khachhang.makh%TYPE, 
                                    c_mack luuky.mack%TYPE, c_slgd luuky.soluong%TYPE)
IS
    c_kh1_temp khachhang.makh%TYPE;
    c_sl1_temp luuky.soluong%TYPE;
    c_kh2_temp khachhang.makh%TYPE;
    c_sl2_temp luuky.soluong%TYPE;
    c_loi EXCEPTION;
BEGIN
    IF c_slgd>0 THEN
        SELECT makh, soluong
        INTO c_kh1_temp,c_sl1_temp
        FROM luuky
        WHERE makh=c_kh1;
        
        SELECT makh, soluong
        INTO c_kh2_temp,c_sl2_temp
        FROM luuky
        WHERE makh=c_kh2;
        
        if c_kh1_temp is not null and c_sl1_temp>c_slgd and c_kh2_temp is not null THEN
            tangluuky(
        
    ELSE 
        RAISE c_loi ;
    END IF;
    
    
END;
