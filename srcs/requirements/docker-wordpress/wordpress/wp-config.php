<?php

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME'));

/** MySQL database username */
define( 'DB_USER', getenv('WORDPRESS_DB_USER'));

/** MySQL database password */
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD'));

/**
 * Docker image fallback values above are sourced from the official WordPress installation wizard:
 * https://github.com/WordPress/WordPress/blob/f9cc35ebad82753e9c86de322ea5c76a9001c7e2/wp-admin/setup-config.php#L216-L230
 * (However, using "example username" and "example password" in your database is strongly discouraged.  Please use strong, random credentials!)
 */

/** MySQL hostname */
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST'));

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', getenv('WORDPRESS_DB_CHARSET'));

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', getenv('WORDPRESS_DB_COLLATE'));

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'auth_key');
define( 'SECURE_AUTH_KEY',  'secure_auth_key');
define( 'LOGGED_IN_KEY',    'logged_in_key');
define( 'NONCE_KEY',        'nonce_key');
define( 'AUTH_SALT',        'auth_salt');
define( 'SECURE_AUTH_SALT', 'secure_auth_salt');
define( 'LOGGED_IN_SALT',   'logged_in_salt');
define( 'NONCE_SALT',       'nonce_salt');

$table_prefix = getenv('WORDPRESS_DB_PREFIX');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', getenv('WORDPRESS_DEBUG'));

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', getenv('WORDPRESS_ABS_PATH') . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
