<?php

namespace App\Console\Commands;

use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;

class ResetPasswordsToDefault extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:reset-passwords-to-default';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Reset all non-admin user passwords to Lastname@dti06';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $users = User::where('is_admin', false)->get();
        $count = 0;

        foreach ($users as $user) {
            $name = trim($user->name);
            
            if (str_contains($name, ',')) {
                // Format: Lastname, Firstname
                $lastName = trim(explode(',', $name)[0]);
            } else {
                // Format: Firstname Lastname
                $parts = explode(' ', $name);
                $lastName = trim(end($parts));
            }

            $password = $lastName . '@dti06';
            $user->password = Hash::make($password);
            $user->save();
            $count++;
        }

        $this->info("Successfully reset {$count} passwords.");
    }
}
