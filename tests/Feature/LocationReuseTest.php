<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\EmployeeLocation;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class LocationReuseTest extends TestCase
{
    use RefreshDatabase;

    protected $admin;
    protected $user1;
    protected $user2;
    protected $location1;

    protected function setUp(): void
    {
        parent::setUp();
        
        $this->admin = User::create([
            'name' => 'Admin User',
            'email' => 'admin@dti6.gov.ph',
            'password' => bcrypt('password'),
            'is_admin' => true,
        ]);

        $this->user1 = User::create([
            'name' => 'User One',
            'email' => 'user1@example.com',
            'password' => bcrypt('password'),
            'is_admin' => false,
        ]);

        $this->user2 = User::create([
            'name' => 'User Two',
            'email' => 'user2@example.com',
            'password' => bcrypt('password'),
            'is_admin' => false,
        ]);

        $this->location1 = EmployeeLocation::create([
            'user_id' => $this->user1->id,
            'address' => 'Old Address 1',
            'latitude' => 10.1,
            'longitude' => 120.1,
            'recorded_at' => now()->subDay(),
        ]);
    }

    /**
     * Test that a user can reuse their own location.
     */
    public function test_user_can_reuse_own_location()
    {
        $response = $this->actingAs($this->user1)
            ->post("/api/location/reuse/{$this->location1->id}");

        $response->assertStatus(200);
        $response->assertJson(['status' => 'success']);

        $this->assertEquals(2, EmployeeLocation::where('user_id', $this->user1->id)->count());
        
        $latest = EmployeeLocation::where('user_id', $this->user1->id)->latest('id')->first();
        $this->assertEquals('Old Address 1', $latest->address);
        $this->assertEquals(10.1, $latest->latitude);
        $this->assertEquals($this->location1->longitude, $latest->longitude);
        $this->assertNotEquals($this->location1->id, $latest->id);
    }

    /**
     * Test that a user cannot reuse another user's location.
     */
    public function test_user_cannot_reuse_another_users_location()
    {
        $response = $this->actingAs($this->user2)
            ->post("/api/location/reuse/{$this->location1->id}");

        $response->assertStatus(403);
        $this->assertEquals(0, EmployeeLocation::where('user_id', $this->user2->id)->count());
    }

    /**
     * Test that an admin can reuse any user's location.
     */
    public function test_admin_can_reuse_any_users_location()
    {
        $response = $this->actingAs($this->admin)
            ->post("/api/location/reuse/{$this->location1->id}");

        $response->assertStatus(200);
        $response->assertJson(['status' => 'success']);

        // The new location should still belong to user1
        $this->assertEquals(2, EmployeeLocation::where('user_id', $this->user1->id)->count());
        
        $latest = EmployeeLocation::where('user_id', $this->user1->id)->latest('id')->first();
        $this->assertEquals('Old Address 1', $latest->address);
        $this->assertNotEquals($this->location1->id, $latest->id);
    }
}
