<?php

class CommuneController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {


        $commune = new Application_Model_DbTable_Commune();
        $this->view->$communes = $commune->fetchAll();
    }

    public function ajouterAction() {
        // action body
    }

    public function modifierAction() {
        // action body
    }

    public function suprimerAction() {
        // action body
    }

}

