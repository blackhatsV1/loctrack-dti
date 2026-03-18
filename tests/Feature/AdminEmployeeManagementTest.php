<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\EmployeeLocation;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AdminEmployeeManagementTest extends TestCase
{
    use RefreshDatabase;

    protected $admin;
    protected $user;

    protected function setUp(): void
    {
        parent::setUp();
        
        $this->admin = User::create([
            'name' => 'Admin User',
            'email' => 'admin@dti6.gov.ph',
            'password' => bcrypt('password'),
            'is_admin' => true,
        ]);

        $this->user = User::create([
            'name' => 'Regular User',
            'email' => 'user@example.com',
            'password' => bcrypt('password'),
            'is_admin' => false,
        ]);
    }

    public function test_admin_can_view_employees_page()
    {
        $response = $this->actingAs($this->admin)->get(route('admin.employees'));
        $response->assertStatus(200);
        $response->assertSee('Employees');
    }

    public function test_admin_can_add_employee()
    {
        $employeeData = [
            'name' => 'New Employee',
            'email' => 'new@example.com',
            'mobile_no' => '09123456789',
        ];

        $response = $this->actingAs($this->admin)->post(route('admin.employees.store'), $employeeData);

        $response->assertRedirect(route('admin.employees'));
        $response->assertSessionHas('success');

        $this->assertDatabaseHas('users', [
            'name' => 'New Employee',
            'email' => 'new@example.com',
            'is_admin' => false,
        ]);

        $newUser = User::where('email', 'new@example.com')->first();
        $this->assertDatabaseHas('employee_locations', [
            'user_id' => $newUser->id,
            'mobile_no' => '09123456789',
        ]);
    }

    public function test_admin_can_delete_employee()
    {
        $employee = User::create([
            'name' => 'To Be Deleted',
            'email' => 'deleted@example.com',
            'password' => bcrypt('password'),
            'is_admin' => false,
        ]);

        EmployeeLocation::create([
            'user_id' => $employee->id,
            'mobile_no' => '123',
            'latitude' => 0,
            'longitude' => 0,
        ]);

        $response = $this->actingAs($this->admin)->delete(route('admin.employees.destroy', $employee));

        $response->assertRedirect(route('admin.employees'));
        $response->assertSessionHas('success');

        $this->assertDatabaseMissing('users', ['id' => $employee->id]);
        $this->assertDatabaseMissing('employee_locations', ['user_id' => $employee->id]);
    }

    public function test_non_admin_cannot_add_employee()
    {
        $employeeData = [
            'name' => 'Should Fail',
            'email' => 'fail@example.com',
            'mobile_no' => '000',
        ];

        $response = $this->actingAs($this->user)->post(route('admin.employees.store'), $employeeData);

        // Should be redirected to dashboard if not an admin
        $response->assertRedirect(route('dashboard')); 
        $this->assertDatabaseMissing('users', ['email' => 'fail@example.com']);
    }

    public function test_non_admin_cannot_delete_employee()
    {
        $employee = User::create([
            'name' => 'Safe User',
            'email' => 'safe@example.com',
            'password' => bcrypt('password'),
            'is_admin' => false,
        ]);

        $response = $this->actingAs($this->user)->delete(route('admin.employees.destroy', $employee));

        $response->assertRedirect(route('dashboard'));
        $this->assertDatabaseHas('users', ['id' => $employee->id]);
    }
}
