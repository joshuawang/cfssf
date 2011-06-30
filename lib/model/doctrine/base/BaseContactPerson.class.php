<?php

/**
 * BaseContactPerson
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $name
 * @property string $title
 * @property string $email
 * @property string $address
 * @property string $phone
 * @property integer $organization_id
 * @property Organization $Organization
 * 
 * @method string        getName()            Returns the current record's "name" value
 * @method string        getTitle()           Returns the current record's "title" value
 * @method string        getEmail()           Returns the current record's "email" value
 * @method string        getAddress()         Returns the current record's "address" value
 * @method string        getPhone()           Returns the current record's "phone" value
 * @method integer       getOrganizationId()  Returns the current record's "organization_id" value
 * @method Organization  getOrganization()    Returns the current record's "Organization" value
 * @method ContactPerson setName()            Sets the current record's "name" value
 * @method ContactPerson setTitle()           Sets the current record's "title" value
 * @method ContactPerson setEmail()           Sets the current record's "email" value
 * @method ContactPerson setAddress()         Sets the current record's "address" value
 * @method ContactPerson setPhone()           Sets the current record's "phone" value
 * @method ContactPerson setOrganizationId()  Sets the current record's "organization_id" value
 * @method ContactPerson setOrganization()    Sets the current record's "Organization" value
 * 
 * @package    cfssf
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseContactPerson extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('contact_person');
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('title', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('email', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('address', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('phone', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('organization_id', 'integer', null, array(
             'type' => 'integer',
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Organization', array(
             'local' => 'organization_id',
             'foreign' => 'id'));
    }
}