//
//  DBSViewController.m
//  Kings
//
//  Created by David Sanders on 11/11/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import "DBSViewController.h"
#import "DBSKingsCell1.h"
#import "DBSAddPlayerViewController.h"

@interface DBSViewController ()
@end

@implementation DBSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.playersTableView = [[UITableView init]alloc];
    _addedPlayer = [[DBSPlayer alloc] init];
    _game = [[DBSGame alloc] init];
    [_game initWithCards];
    self.originalCenter = self.view.center;
    self.nextPosition = 0;
    self.pickMate = NO;
}
-(void)viewDidAppear:(BOOL)animated{
    //DBSPlayer *test = _addedPlayer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPlayerButtonClick:(id)sender {
    /*
     if (![self.addPlayerTextField.text isEqualToString:@""])
     {
     DBSPlayer *player = [[DBSPlayer alloc]init];
     player.mate = [[NSMutableArray alloc]init];
     player.images = [[NSMutableArray alloc]init];
     player.name = self.addPlayerTextField.text;
     [self.game.players addObject:player];
     [self.playersTableView reloadData];
     self.addPlayerTextField.text = @"";
     }
     */
}

-(void)setAddPlayerName:(NSString *)addPlayerName   //Gets called whenever self.addPlayerName get set a value
{
    NSString *newPlayer = addPlayerName;
    DBSPlayer *player = [[DBSPlayer alloc]init];
    player.mate = [[NSMutableArray alloc]init];
    player.images = [[NSMutableArray alloc]init];
    player.name = newPlayer;
    [self.game.players addObject:player];
    [self.playersTableView reloadData];
}

- (IBAction)startGameButtonClick:(id)sender {
    self.addPlayerButton.enabled = NO;
    self.addPlayerTextField.enabled = NO;
    self.cardButton.enabled = YES;
    self.game.currentPlayer = self.game.players[0];
    self.nextPosition = 0;
}

- (IBAction)newGameButtonClick:(id)sender {
    if (self.game.players.count != 0) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"Are you sure drunkie?"
                                      delegate:self
                                      cancelButtonTitle:@"Oops"
                                      destructiveButtonTitle:@"Yeah i'm sure. You dont' know my life."
                                      otherButtonTitles:nil];
        [actionSheet showInView:self.view];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Nope" message:@"You need to have players first"
                              delegate:self cancelButtonTitle:@"Oops my bad" otherButtonTitles:nil];
        [alert show];
    }
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSMutableArray *playerList = [NSMutableArray arrayWithArray:self.game.players];
        self.ruleNameLabel.text = @"Rule Name";
        self.ruleExplainationLabel.text = @"Welcome to the wonderful game of drinking......or kings....or circle of death. Whatever you wanna call it, it's a lot of fun. You touch the card to draw a new one. The card rule appears above me, and here you will find an explaination of the rule. Start by adding players, and then after that click Start Game. And remember, drink responsibly....or don't, I really don't care, i'm only an iPad. Just don't take me in the car with you if you do.";
        [self.cardButton setBackgroundImage:[UIImage imageNamed:@"card1"] forState:UIControlStateNormal];
        _game = [[DBSGame alloc] init];
        [_game initWithCards];
        self.game.players = playerList;
        self.nextPosition = 0;
        self.addPlayerButton.enabled = YES;
        self.addPlayerTextField.enabled = YES;
        self.cardButton.enabled = NO;
        self.game.currentPlayer = self.game.players[0];
        for (DBSPlayer *player in self.game.players) {
            [player.mate removeAllObjects];
            [player.images removeAllObjects];
        }
        [self.playersTableView reloadData];
    }
}

- (IBAction)cardButtonClick:(id)sender {
    DBSCard *card = [[DBSCard alloc] init];
    card = [self.game drawCard];
    self.ruleNameLabel.text = card.ruleName;
    self.ruleExplainationLabel.text = card.ruleExplaination;
    [self.cardButton setBackgroundImage:[UIImage imageNamed:card.image]
                               forState:UIControlStateNormal];
    [self executeRule:card];
    self.nextPosition = [self.game.players indexOfObject:self.game.currentPlayer] + 1;
    if (self.nextPosition >= self.game.players.count)
    {
        self.nextPosition = 0;
    }
    self.game.currentPlayer = [self.game.players objectAtIndex:self.nextPosition];
    [self.playersTableView reloadData];
}

-(void)executeRule:(DBSCard *)card
{
    if ([card.ruleKeyword isEqualToString:@"drinkTake"]) {
        NSString *message = [NSString stringWithFormat:@"Time to drink %@ %@",self.game.currentPlayer.name, [self.game.currentPlayer returnMates]];
        self.drinkingStatus.text = message;
    }
    else if ([card.ruleKeyword isEqualToString:@"drinkGive"])
    {
        NSString *message = [NSString stringWithFormat:@"Give out some drinks %@",self.game.currentPlayer.name];
        self.drinkingStatus.text = message;
    }
    else if ([card.ruleKeyword isEqualToString:@"airHand"])
    {
        
        for (DBSPlayer *player in self.game.players) {
            if ([player.images containsObject:@"hand1"]) {
                [player.images removeObject:@"hand1"];
            }
        }
        //DBSPlayer *player = [self.game.players objectAtIndex:self.nextPosition];
        [self.game.currentPlayer.images addObject:@"hand1"];
        //[player.images addObject:@"hand1"];
        [self.playersTableView reloadData];
        
        self.drinkingStatus.text = @"Hands in the air!!!";
    }
    else if ([card.ruleKeyword isEqualToString:@"waterfall"])
    {
        self.drinkingStatus.text = @"WATERFALL!!!!";
    }
    else if ([card.ruleKeyword isEqualToString:@"mate"])
    {
        NSString *message = [NSString stringWithFormat:@"Pick a mate %@",self.game.currentPlayer.name];
        self.drinkingStatus.text = message;
        self.pickMate = YES;
        self.cardButton.enabled = NO;
    }
    else if ([card.ruleKeyword isEqualToString:@"rhyme"])
    {
        self.drinkingStatus.text = @"Lets get the rhyming (Frank smh)";
    }
    else if ([card.ruleKeyword isEqualToString:@"category"])
    {
        NSString *message = [NSString stringWithFormat:@"Pick a category %@",self.game.currentPlayer.name];
        self.drinkingStatus.text = message;
    }
    else if ([card.ruleKeyword isEqualToString:@"questions"])
    {
        self.drinkingStatus.text = @"Are you a buffalo?";
    }
    else if ([card.ruleKeyword isEqualToString:@"thumbQueen"])
    {
        NSString *message = [NSString stringWithFormat:@"%@ is the queen of all thumbs",self.game.currentPlayer.name];
        self.drinkingStatus.text = message;
        
        for (DBSPlayer *player in self.game.players) {
            if ([player.images containsObject:@"thumb1"]) {
                [player.images removeObject:@"thumb1"];
            }
        }
        [self.game.currentPlayer.images addObject:@"thumb1"];
        [self.playersTableView reloadData];
    }
    else if ([card.ruleKeyword isEqualToString:@"rule"])
    {
        NSString *message = [NSString stringWithFormat:@"%@ IS A GOD!!!",self.game.currentPlayer.name];
        self.drinkingStatus.text = message;
        
        for (DBSPlayer *player in self.game.players) {
            if ([player.images containsObject:@"crown1"]) {
                [player.images removeObject:@"crown1"];
            }
        }
        [self.game.currentPlayer.images addObject:@"crown1"];
        [self.playersTableView reloadData];
    }
    else
    {
        self.drinkingStatus.text = @"SOCIAL!!!!";
    }
}

- (IBAction)textFieldDoneEditing:(id)sender {
    self.view.center = self.originalCenter;
    self.addPlayerButton.enabled = YES;
}

- (IBAction)textFieldStartedEditing:(id)sender {
    self.view.center = CGPointMake(700, self.originalCenter.y);
    self.addPlayerButton.enabled = NO;
}

- (IBAction)editPlayersButtonClick:(UIButton *)sender
{
    if (!self.playersTableView.editing)
    {
        [self.playersTableView setEditing:YES animated:YES];
    }
    else
    {
        [self.playersTableView setEditing:NO animated:YES];
    }
    [self.playersTableView reloadData];
}

-(void)recieveNewPlayer:(DBSPlayer *)player
{
    _addedPlayer = player;
}

-(void)doneAddingPlayer:(NSString *)player
{
    self.addPlayerName = player;
    //[self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark-
#pragma mark TableView Datasource and delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.game.players count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    static NSString *SimpleTableIdentifier = @"DBSKingsCell1";
    DBSKingsCell1 *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil)
    {
        //cell = [[DBSKingsCell1 alloc]
        //        initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
        cell = [[DBSKingsCell1 alloc]init];
    }
    DBSPlayer *player = [[DBSPlayer alloc]init];
    player = [self.game.players objectAtIndex:indexPath.row];
    //cell.textLabel.text = player.name;
    cell.playerLabel.text = player.name;
    if (self.nextPosition == indexPath.row) {
        cell.contentView.backgroundColor = [UIColor yellowColor];
        //cell.backgroundColor.backgroundColor = [UIColor yellowColor];
    }
    else
    {
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        //cell.backgroundColor.backgroundColor = [UIColor whiteColor];
    }
    NSMutableString *mates = [[NSMutableString alloc]init];
    for (NSString *mate in player.mate) {
        [mates appendString:mate];
        [mates appendString:@" "];
    }
    NSString *subtitle = [NSString stringWithFormat:@"Mates: %@", mates];
    //cell.detailTextLabel.text = subtitle;
    cell.matesLabel.text = subtitle;
    cell.airHandImage.image = NULL;
    cell.thumbQueenImage.image = NULL;
    cell.kingImage.image = NULL;
    if (player.images != NULL) {
        for (NSString *imageString in player.images) {
            if ([imageString  isEqual: @"hand1"])
            {
                UIImage *image = [UIImage imageNamed:imageString];
                cell.airHandImage.image = image;
            }
            else if ([imageString isEqualToString:@"crown1"])
            {
                UIImage *image = [UIImage imageNamed:imageString];
                cell.kingImage.image = image;
            }
            else
            {
                UIImage *image = [UIImage imageNamed:imageString];
                cell.thumbQueenImage.image = image;
            }
        }
    }
    
    return cell;
}

#pragma mark - TableView Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.pickMate == YES) {
        NSInteger currentPosition = 0;
        if (self.nextPosition != 0)
        {
            currentPosition = self.nextPosition - 1;
        }else
        {
            currentPosition = self.game.players.count - 1;
        }
        for (DBSPlayer *player1 in self.game.players) {
            if ([self.game.players indexOfObject:player1] == indexPath.row) {
                for (DBSPlayer *player2 in self.game.players) {
                    if ([self.game.players indexOfObject:player2] == currentPosition){
                        if ((![player1.mate containsObject:player2.name] || ![player2.mate containsObject:player1.name]) || [self.game.players count] < 4) {
                            [player1.mate addObject:player2.name];
                            if (![player1.name isEqualToString:player2.name]) {
                                [player2.mate addObject:player1.name];
                            }
                            self.cardButton.enabled = YES;
                            [self.playersTableView reloadData];
                            self.pickMate = NO;
                        }
                        else{
                            UIAlertView *alert = [[UIAlertView alloc]
                                                  initWithTitle:@"Nope" message:@"You need to pick someone who isn't your mate"
                                                  delegate:self cancelButtonTitle:@"Oops my bad" otherButtonTitles:nil];
                            [alert show];
                        }
                    }
                }
            }
        }
        /*
         DBSPlayer *player1 = self.game.players[currentPosition];
         DBSPlayer *player2 = self.game.players[indexPath.row];
         [player1.mate addObject:player2.name];
         [player2.mate addObject:player1.name];
         self.cardButton.enabled = YES;
         [self.playersTableView reloadData];
         */
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    DBSPlayer *movedPlayer = [self.game.players objectAtIndex:sourceIndexPath.row];
    [self.game.players removeObjectAtIndex:sourceIndexPath.row];
    [self.game.players insertObject:movedPlayer atIndex:destinationIndexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)table commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.game.players removeObjectAtIndex:indexPath.row];
        [self.playersTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark Segue methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[DBSAddPlayerViewController class]])
    {
        DBSAddPlayerViewController *destination = segue.destinationViewController;
        if ([destination respondsToSelector:@selector(setDelegate:)])
        {
            destination.delegate = self;
            //[destination setValue:self forKey:@"delegate"];
        }
    }
    else if ([segue.destinationViewController isKindOfClass:[DBSOptionsViewController class]])
              {
                  DBSOptionsViewController *destination = segue.destinationViewController;
                  destination.delegate = self;
              }
    
}

#pragma mark Delegate methods

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didSave
{
    [self dismissViewControllerAnimated:YES completion:nil];    
}

@end
