//
//  User+CoreDataProperties.h
//  closetX
//
//  Created by Lacey Vu on 4/20/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *profileImage;
@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *item;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addItemObject:(NSManagedObject *)value;
- (void)removeItemObject:(NSManagedObject *)value;
- (void)addItem:(NSSet<NSManagedObject *> *)values;
- (void)removeItem:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
