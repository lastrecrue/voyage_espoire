<?php

class Application_Model_DbTable_Commune extends Zend_Db_Table_Abstract
{

    protected $_name = 'commune';
    
     public function getCommune($id)
    {
        $id = (int)$id;
        $row = $this->fetchRow('id = ' . $id);
        if (!$row) {
            throw new Exception("Impossible de trouver l'enregistrement $id");
        }
        return $row->toArray();
    }


}

