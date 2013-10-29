<?php
//include_once( $_SERVER['DOCUMENT_ROOT'] . '/config.ini.php' );
include_once( 'config.ini.php' );
class database {
	
	var $db = null;
	var $db_name = null;
	var $db_host = null;
	var $db_user = null;
	var $db_passwd = null;
	
	function database(){
		$this->db = new mysqli(HOST_NAME, USER_NAME, USER_PASSWD, DB_NAME);
		$this->db->query("SET NAMES 'utf8'");
		if ($this->db->connect_error) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
		}

		return $this->db;
	}
	
	function query( $query ){
		$obj = $this->db->query($query);

		return $obj;
	}
	
	function maxid( $table ){
		$query = "SELECT MAX(id) AS lastid FROM $table";
		$obj = $this->db->query($query);
		return $obj;
	}
	
	function newid( $table ){
		$newid = $this->maxid($table);
		$id = $newid->fetch_object();
		if ($id->lastid)
			$obj = $id->lastid + 1;
		else 
			$obj = 1;	
		
		return $obj;
	}
	
	function getlist( $id , $name ,$field ){
		$query = "SELECT id, description FROM $name";
		$obj = $this->db->query($query);
		$retval = '<select name="'.$field.'" class="formcontent" id="'.$field.'">
								  <option value="0">Ninguno</option>';
		while ($row = $obj->fetch_object() ){
			$selected = ($id == $row->id)?'"selected="selected"':"";
			$retval .= '<option value="'.$row->id.'" '.$selected.'>'.$row->description.'</option>';		      
		}
		$retval .= '</select>';
		
		return $retval;
	}

         public function num_rows($query_object) {
        $num = mysql_num_rows ( $query_object );
        return $num;
    }
    
}

?>