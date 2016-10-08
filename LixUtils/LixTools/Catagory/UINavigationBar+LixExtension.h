//
//  UINavigationBar+Addition.h
//  UINavigationBar+Addition
//
//  Created by Lix on 16/9/23.
//  Copyright (c) 2016 Neuron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (LixExtension)

/**
 * Hide 1px hairline of the nav bar
 */
- (void)lix_hideBottomHairline;

/**
 * Show 1px hairline of the nav bar
 */
- (void)lix_showBottomHairline;

/**
 * Makes the navigation bar background transparent.
 */
- (void)lix_makeTransparent;

/**
 * Restores the default navigation bar appeareance
 **/
- (void)lix_makeDefault;

@end
