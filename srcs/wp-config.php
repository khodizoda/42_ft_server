<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpressdb' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'gw13xiMQDRm6xNG' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'CFCId+UjoeFjzpDA(W!C07|;{45arCdSoC0*$mT|:liQtL@g,,+ft-x7,|dC0t}Z');
define('SECURE_AUTH_KEY',  'S2@4|K#Z(%X;Y*/wfH7jX.[XY Bx!NcOb4;ZDw#5__=dlE}8E>-:~?)o.WW4gY+|');
define('LOGGED_IN_KEY',    'E1>[:~p@b%97C.?f4 *duwlrisv74V$ELr%R]RVXV5_@u+u4KK%,-L>&JEFelm*b');
define('NONCE_KEY',        'owT4@53yD-Y)Y<XBMeJkS`MOE.-`Qi:#n%3~FEZ5D Uv<+1JNF4y6HAu9`(gTI#|');
define('AUTH_SALT',        'B76{U3E}I+y`ARV`8_.-#<ZROPSv )3]$D9]M@qJx`h!|5#Z879QaR.Pr 6Ma9o|');
define('SECURE_AUTH_SALT', 'R3k.w~^186c=^v{gB%4pU?&=]+@4ho)MV:@<LrXj2&`xMj^=VgVO8NrWP@mx?;|U');
define('LOGGED_IN_SALT',   '-C_bqur|(}h&flx]N]|e8rdDIWhGKSpy^-t`qX>>=O|%@?sFk.]0}3mDK2u?RMuJ');
define('NONCE_SALT',       ')(*@u,XSg) +?%6S#o:k)]+J?JZD>[_0ow^z<,4v,$`I+4|F{LPpbb!pbs>-PA6^');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'db_';

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
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
