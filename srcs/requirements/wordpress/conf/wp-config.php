<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('SQL_DATABASE') );

/** Database username */
define( 'DB_USER', getenv('SQL_USER'));

/** Database password */
define( 'DB_PASSWORD', getenv('SQL_USER_PASSWORD'));

/** Database hostname */
define('DB_HOST', getenv('WORDPRESS_DB_HOST') . ':3306');

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

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
define('AUTH_KEY',         '1,]!gwl-b7<B)I4+DLd8LDS0[5Z}+4b]E7Dj+r@A_+|pd}stl&dN4i s?`=5,$J2');
define('SECURE_AUTH_KEY',  '+d0`(NS}+n bt/|(5^(.!7Pkn1$EbA|BJIHf1XhZaG:(M77oGvMK+#3W|9W)4{B<');
define('LOGGED_IN_KEY',    'cAajmrDPC+(xrWc)w4,I8K#mL,#?uDuEwGAs5Y@P;-XW5?!gj?+-RhE#NO>b.]-h');
define('NONCE_KEY',        '!l7ikPfdE+bRe5sZ[|-A.{lc_H/@,w3?>~/T&-hWyE0(fH>Ypk,n&u)0^02zXA-6');
define('AUTH_SALT',        'IjX=M-Y+/V3EMrGX!|}v[] qMA+7sYUR)gC&AqL@X@} PHRw&b{Eh>7T%h@z_j6n');
define('SECURE_AUTH_SALT', 'kc=*l56X-m>u1Fy<&nor_Oxl:0w|h--%hy<_TK48lIuG]h1jkrLDamV!|`K@0qxR');
define('LOGGED_IN_SALT',   '.(!}+4PXkaMx>D?b^K-!ib0G6WM_r?n2yt3Mf8K$ikB;UB;;7[L+yaHRDJYjcX)d');
define('NONCE_SALT',       '#+-+Cxn39wYch?Mo@o#Z%=B~^]/|)G9{9IGSs7rRQ|Dp^R&4??<W{p7]e UOM[Ba');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'sdkfjsj_';

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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';