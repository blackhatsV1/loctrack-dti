<?php

namespace Tests\Feature;

use Tests\TestCase;

class SessionTest extends TestCase
{
    /**
     * Verify that the session is configured to expire on close.
     */
    public function test_session_expires_on_close_config(): void
    {
        $this->assertTrue(config('session.expire_on_close'), 'The session.expire_on_close configuration should be true.');
    }
}
