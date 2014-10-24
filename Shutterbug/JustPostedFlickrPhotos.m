//
//  JustPostedFlickrPhotos.m
//  Shutterbug
//
//  Created by Matt Birmingham on 9/23/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "JustPostedFlickrPhotos.h"
#import "FlickrFetcher.h"

@interface JustPostedFlickrPhotos ()

@end

@implementation JustPostedFlickrPhotos



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchPhotos];
    // Do any additional setup after loading the view.
}

- (void) fetchPhotos {
    
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
#warning Blocks main thread TODO: make async
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults
                                                                        options:0
                                                                          error:NULL];
    
    NSString *testJson = [[NSString alloc]initWithData:jsonResults encoding:NSUTF8StringEncoding];
    
    //[NSJSONSerialization JSONObjectWithData:jsonResults
    //                                                     options:0
    //                                                       error:NULL];
    
    //NSLog(@"Flickr results = %@", propertyListResults);
    NSLog(@"Flickr results = %@", testJson);
    // You can then use http://www.jsoneditoronline.org/ to dump & view the architecture
    NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    self.photos = photos;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
