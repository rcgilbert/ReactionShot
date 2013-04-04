//
//  ViewController.m
//  ReactionShot
//
//  Created by Ryan Gilbert on 4/2/13.
//  Copyright (c) 2013 Ryan Gilbert. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonTouched:(id)sender
{
    UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
    cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    cameraController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    cameraController.showsCameraControls = NO;
    cameraController.cameraOverlayView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"simpsons.jpg"]];
    cameraController.cameraOverlayView.contentMode = UIViewContentModeScaleAspectFit;
    cameraController.cameraOverlayView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    cameraController.cameraOverlayView.backgroundColor = [UIColor blackColor];
    cameraController.delegate = self;
    [self presentViewController:cameraController animated:YES completion:^{
        sleep(1);
        [cameraController takePicture];
    }];
}
- (IBAction) dismissPic:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *pic = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageView *picView = [[UIImageView alloc] initWithImage:pic];
    picView.contentMode = UIViewContentModeScaleAspectFit;
    picView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIViewController *picController = [self.storyboard instantiateViewControllerWithIdentifier:@"picDisplay"];
    [picController.view addSubview:picView];
    [self dismissViewControllerAnimated:NO completion:nil];
    [self presentViewController:picController animated:YES completion:nil];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
