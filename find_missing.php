<?php
$local = file('local_normalized.txt');
$production = file('production_normalized.txt');

function clean($str) {
    return strtolower(preg_replace('/[^a-z0-9]/i', '', $str));
}

$prod_clean_names = [];
foreach ($production as $p) {
    $parts = explode('|', trim($p));
    if (count($parts) < 2) continue;
    $prod_clean_names[clean($parts[1])] = true;
}

echo "--- Truly Missing Records (Local only) ---\n";
foreach ($local as $l) {
    $parts = explode('|', trim($l));
    if (count($parts) < 2) continue;
    $clean_name = clean($parts[1]);
    if (!isset($prod_clean_names[$clean_name])) {
        echo "{$parts[1]} | {$parts[0]}\n";
    }
}
