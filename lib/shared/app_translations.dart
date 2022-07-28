import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // general
          "app_name": "Logical Defense",
          "navigation_drawer_open": "Open navigation drawer",
          "navigation_drawer_close": "Close navigation drawer",
          "action_about": "About",
          "category_label": "Categories",
          "subtitle": "The beautiful list of logical fallacies",
          "title_activity_about": "About",
          "action_settings": "Settings",
          "creator": "Created by LukeStoneHm\n2015",
          "about_more":
              "A simple, but beautiful app that presents the logical fallacies of the world in a fantastically eye pleasing manner.\n\nThis app is an open source project and is licensed under the GPL 2 license.\n\nFeel free to browse the source code which is hosted on GitHub.\n\nhttps://github.com/LukeStonehm/LogicalDefence/",
          "from": "\n\nShared From Logical Defence Application",
          "share": "Share a fallacy",
          "action_language": "Language",
          "language_dialog_title": "Choose language",

          // locales
          "locale_name_de": "German",
          "locale_name_en": "English",
          "locale_name_en_rUS": "English (US)",
          "locale_name_es": "Spanish",
          "locale_name_fr": "French",
          "locale_name_it": "Italian",
          "locale_name_pt": "Portuguese",
          "locale_name_pl": "Polish",
          "locale_name_eo": "Esperanto",

          // sections
          "sections_0": "Appeal to the Mind",
          "sections_1": "Appeal to the Emotions",
          "sections_2": "Faulty Deduction",
          "sections_3": "Garbled Cause & Effect",
          "sections_4": "Manipulating Content",
          "sections_5": "On the Attack",

          // fallacies
          "fallacies_titles_0_0": "Appeal to Anonymous Authority",
          "fallacies_titles_0_1": "Appeal to Authority",
          "fallacies_titles_0_2": "Appeal to Common Practice",
          "fallacies_titles_0_3": "Appeal to Ignorance",
          "fallacies_titles_0_4": "Appeal to Incredulity",
          "fallacies_titles_0_5": "Appeal to Money",
          "fallacies_titles_0_6": "Appeal to Novelty",
          "fallacies_titles_0_7": "Appeal to Popular Belief",
          "fallacies_titles_0_8": "Appeal to Probability",
          "fallacies_titles_0_9": "Appeal to Tradition",
          "fallacies_descs_0_0":
              "Using evidence from an unnamed \'expert\' or \'study\' or generalized group (like \'scientists\') to claim something is true.",
          "fallacies_descs_0_1":
              "Claiming something is true because an (a person holding authority) \'expert\' says it is.",
          "fallacies_descs_0_2":
              "Claiming something is true because it\'s commonly practiced.",
          "fallacies_descs_0_3":
              "A claim is true simply because it has not been proven false (or false because it has not been proven true).",
          "fallacies_descs_0_4":
              "Because a claim sounds unbelievable, it must not be true.",
          "fallacies_descs_0_5":
              "Supposing that, if someone is rich or something is expensive, then it affects the truth of the claim.",
          "fallacies_descs_0_6":
              "Supposing something is better because it is new or newer.",
          "fallacies_descs_0_7":
              "Claiming something is true because the majority of people believe it.",
          "fallacies_descs_0_8":
              "Assuming because something could happen, it will inevitably happen.",
          "fallacies_descs_0_9":
              "Claiming something is true because it\'s (apparently) always been that way.",
          "fallacies_examples_0_0":
              "\'They say that it takes 7 years to digest chewing gum.\'",
          "fallacies_examples_0_1":
              "\'Over 4000 prominent scientists and engineers dispute global warming.\'",
          "fallacies_examples_0_2":
              "\'This bank has some problems with corruption, but there\'s nothing going on here that doesn\'t go on in all other banks.\'",
          "fallacies_examples_0_3":
              "\'Nobody has proven to me there\'s a God. So I know there is no God.\'",
          "fallacies_examples_0_4":
              "\'The eye is an incredibly complex biomechanical machine with thousands of interlocking parts. How could that exist without an intelligent designer?\'",
          "fallacies_examples_0_5": "\'If it costs more, it must be better.\'",
          "fallacies_examples_0_6":
              "\'Awesome! The latest version of this operating system is going to make my computer faster and better..\'",
          "fallacies_examples_0_7": "\'Milk is essential for healthy bones.\'",
          "fallacies_examples_0_8":
              "\'There are billions of galaxies with billions of stars in the universe, so there must be another planet with intelligent life on it.\'",
          "fallacies_examples_0_9":
              "\'The government has always existed, therefore society cannot live without one.\'",
          "fallacies_titles_1_0": "Appeal to Consequences of a Belief",
          "fallacies_titles_1_1": "Appeal to Fear",
          "fallacies_titles_1_2": "Appeal to Flattery",
          "fallacies_titles_1_3": "Appeal to Nature",
          "fallacies_titles_1_4": "Appeal to Pity",
          "fallacies_titles_1_5": "Appeal to Ridicule",
          "fallacies_titles_1_6": "Appeal to Spite",
          "fallacies_titles_1_7": "Appeal to Wishful Thinking",
          "fallacies_descs_1_0":
              "Arguing a belief is false because it implies something you\'d rather not believe.",
          "fallacies_descs_1_1":
              "An argument is made by increasing fear and prejudice towards the opposing side.",
          "fallacies_descs_1_2":
              "Using an irrelevant compliment to slip in an unfounded claim which is accepted along with the compliment.",
          "fallacies_descs_1_3":
              "Making your claim seem more true by drawing a comparison with the \'good\' natural world.",
          "fallacies_descs_1_4": "Attempt to induce pity to sway opponents.",
          "fallacies_descs_1_5":
              "Presenting the opponent\'s argument in a way that makes it appear absurd.",
          "fallacies_descs_1_6":
              "Dismissing a claim by appealing to personal bias against the claimant.",
          "fallacies_descs_1_7":
              "Suggesting a claim is true or false just because you strongly hope it is.",
          "fallacies_examples_1_0":
              "\'That can\'t be the Senator on that sex-tape. If it were, he\'d be lying about not knowing her, and he\'s not the kind of man who would lie.\'",
          "fallacies_examples_1_1":
              "\'Before you know there will be more mosques than churches.\'",
          "fallacies_examples_1_2":
              "\'Intelligent and sophisticated readers will of course recognize a fallacy like this when they read one.\'",
          "fallacies_examples_1_3":
              "\'Of course homosexuality is unnatural. You don\'t see same-sex animals copulating.\'",
          "fallacies_examples_1_4":
              "\'The former dictator is an old, dying man. It\'s wrong to make him stand trial for these alleged offenses.\'",
          "fallacies_examples_1_5":
              "\'Faith in God is like believing in Santa Claus and the Tooth Fairy.\'",
          "fallacies_examples_1_6":
              "\'Don\'t you just hate how those rich Liberal Hollywood actors go on TV to promote their agendas?\'",
          "fallacies_examples_1_7":
              "\'The President wouldn\'t lie. He\'s our leader and a good American.\'",
          "fallacies_titles_2_0": "Anecdotal Evidence",
          "fallacies_titles_2_1": "Composition",
          "fallacies_titles_2_2": "Division",
          "fallacies_titles_2_3": "Design Fallacy",
          "fallacies_titles_2_4": "Gambler\'s Fallacy",
          "fallacies_titles_2_5": "Hasty Generalization",
          "fallacies_titles_2_6": "Jumping to Conclusions",
          "fallacies_titles_2_7": "Middle Ground",
          "fallacies_titles_2_8": "Perfectionist Fallacy",
          "fallacies_titles_2_9": "Relativist Fallacy",
          "fallacies_titles_2_10": "Spotlight",
          "fallacies_titles_2_11": "Sweeping Generalization",
          "fallacies_titles_2_12": "Undistributed Middle",
          "fallacies_descs_2_0":
              "Discounting evidence arrived at by systematic search or testing in favor of a few first hand stories.",
          "fallacies_descs_2_1":
              "Assuming that characteristics or beliefs of some of a group applies to the entire group.",
          "fallacies_descs_2_2":
              "Assuming that characteristics or beliefs of a group automatically apply to any individual member.",
          "fallacies_descs_2_3":
              "Assuming that because something is nicely designed or beautifully visualized, it\'s more valid or better.",
          "fallacies_descs_2_4":
              "Assuming a history of independent outcomes will affect future outcomes.",
          "fallacies_descs_2_5":
              "Drawing a general conclusion from a tiny sample.",
          "fallacies_descs_2_6":
              "Drawing a quick conclusion without fairly considering relevant (and easily available) evidence.",
          "fallacies_descs_2_7":
              "Assuming because two opposing arguments have merit, the answer must lie somewhere in between them.",
          "fallacies_descs_2_8":
              "Assuming that the only option on the table is perfect success, then rejecting anything that will not work perfectly.",
          "fallacies_descs_2_9":
              "Rejecting a claim because of a belief that truth is relative to a person or group.",
          "fallacies_descs_2_10":
              "Assuming an observation from a small sample size applies to an entire group.",
          "fallacies_descs_2_11": "Applying a general rule too broadly.",
          "fallacies_descs_2_12":
              "Assuming because two things share a property, that makes them the same thing.",
          "fallacies_examples_2_0":
              "\'I\'m going to carry on smoking. My grandfather smoked 40 a day until he died at the age of 90.\'",
          "fallacies_examples_2_1":
              "\'Recent terrorist attacks have been carried out by Islamic groups, therefore all terrorists are Muslims.\'",
          "fallacies_examples_2_2":
              "\'Many Conservatives wish to ban gay marriage, discredit climate change, and deny evolution, therefore all conservatives are homophobic, anti-environment creationists.\'",
          "fallacies_examples_2_3":
              "\'Elementary OS is the most well designed and best looking Linux distribution, therefore it is clearly superior.\'",
          "fallacies_examples_2_4":
              "\'I\'ve flipped a coin 10 times in a row and it\'s been heads each time, therefore the next coin flip is more likely to come up with tails.\'",
          "fallacies_examples_2_5":
              "\'I just got cut off by the woman driver in front. Women can\'t drive.\'",
          "fallacies_examples_2_6":
              "\'She wants birth control in her medical cover? What a slut!\'",
          "fallacies_examples_2_7":
              "\'I rear ended your car but I don\'t think I should pay for the damage. You think I should pay for all the damage. A fair compromise would be to split the bill in half.\'",
          "fallacies_examples_2_8":
              "\'What\'s the point of these anti-drunk driving ad campaigns? People are still going to drink and drive no matter what.\'",
          "fallacies_examples_2_9":
              "\'That\'s perhaps true for you, but it\'s not true for me.\'",
          "fallacies_examples_2_10":
              "\'This large shoe manufacturer employs children in sweatshops. Therefore all shoe companies are evil child-slave owners!\'",
          "fallacies_examples_2_11":
              "\'Those young men rioted because they lacked morally responsible fathers.\'",
          "fallacies_examples_2_12":
              "\'A theory can mean an unproven idea. Scientists use the term \'the Theory of Evolution\', therefore evolution is an unproven idea.\'",
          "fallacies_titles_3_0": "Affirming the Consequent",
          "fallacies_titles_3_1": "Circular Logic",
          "fallacies_titles_3_2": "Cum Hoc Ergo Propter Hoc",
          "fallacies_titles_3_3": "Denying the Antecedent",
          "fallacies_titles_3_4": "Ignoring a Common Cause",
          "fallacies_titles_3_5": "Post Hoc Ergo Propter Hoc",
          "fallacies_titles_3_6": "Two Wrongs Make a Right",
          "fallacies_descs_3_0":
              "Assuming there\'s only one explanation for the observation you\'re making.",
          "fallacies_descs_3_1":
              "A conclusion is derived from premises based on the conclusion.",
          "fallacies_descs_3_2":
              "Claiming two events that occur together must have a cause-and-effect relationship. Also known as \'Confusing Causation with Correlation\'",
          "fallacies_descs_3_3":
              "There isn\'t only one explanation for an outcome, so it\'s false to assume the cause based on the effect.",
          "fallacies_descs_3_4":
              "Claiming one event must have caused the other when a third (unseen) event is probably the cause.",
          "fallacies_descs_3_5":
              "Claiming that because one event follows another, it was also caused by it.",
          "fallacies_descs_3_6":
              "Assuming that if one wrong is committed, another wrong will cancel it out.",
          "fallacies_examples_3_0":
              "\'Marriage often results in the birth of children, so that\'s the only reason why it exists.\'",
          "fallacies_examples_3_1":
              "\'Stripping privacy rights only matters to those with something to hide. You must have something to hide if you oppose stripping privacy rights.\'",
          "fallacies_examples_3_2":
              "\'Teenagers in gangs listen to rap music with violent themes. Rap music inspires violence in teenagers.\'",
          "fallacies_examples_3_3":
              "\'If you get a degree, you\'ll get a good job. If you don\'t get a degree, you won\'t get a good job.\'",
          "fallacies_examples_3_4":
              "\'We had the 60s sexual revolution, and now people are dying of AIDS.\'",
          "fallacies_examples_3_5":
              "\'Since the election of the President, more people than ever are unemployed, therefore the President has damaged the economy.\'",
          "fallacies_examples_3_6":
              "\'Sure - the conditions in this prison are cruel and dehumanizing, but these inmates are criminals!\'",
          "fallacies_titles_4_0": "Ad Hoc Rescue",
          "fallacies_titles_4_1": "Begging the Question",
          "fallacies_titles_4_2": "Biased Generalization",
          "fallacies_titles_4_3": "Confirmation Bias",
          "fallacies_titles_4_4": "False Dilemma",
          "fallacies_titles_4_5": "Lie",
          "fallacies_titles_4_6": "Misleading Vividness",
          "fallacies_titles_4_7": "Red Herring",
          "fallacies_titles_4_8": "Slippery Slope",
          "fallacies_titles_4_9": "Suppressed Evidence",
          "fallacies_titles_4_10": "Unfalsifiability",
          "fallacies_descs_4_0":
              "Trying to save a cherished belief by repeatedly revising the argument to explain away problems.",
          "fallacies_descs_4_1":
              "Hiding other contributory factors and supporting the truth of your claim without any evidence other than the conclusion of your claim.",
          "fallacies_descs_4_2":
              "Generalizing from an unrepresentative sample to increase the strength of your argument.",
          "fallacies_descs_4_3":
              "Looking only for evidence that supports your argument while ignoring contradicting evidence.",
          "fallacies_descs_4_4":
              "Presenting two opposing options as the two options while hiding alternatives.",
          "fallacies_descs_4_5":
              "An outright untruth repeated knowingly as a fact.",
          "fallacies_descs_4_6":
              "Describing an occurrence in vivid detail, even if it is a rare occurrence, to convince someone that it is a true.",
          "fallacies_descs_4_7":
              "Introducing irrelevant material to the argument to distract and lead towards a different conclusion.",
          "fallacies_descs_4_8":
              "Assuming a relatively small first step will inevitably lead to a chain of related (negative) events.",
          "fallacies_descs_4_9":
              "Intentionally failing to use significant and relevant information which counts against one\'s own conclusion.",
          "fallacies_descs_4_10":
              "Offering a claim that cannot be proven false, because there is no way to check if it is false or not.",
          "fallacies_examples_4_0":
              "\'But apart from better sanitation, medicine, education, irrigation, public health, roads, a freshwater system and public order.. What have the Romans done for us?\'",
          "fallacies_examples_4_1":
              "\'All illegal drugs are harmful - that\'s why they\'re illegal.\'",
          "fallacies_examples_4_2":
              "\'Our website poll found that 90% of internet users oppose online piracy laws.\'",
          "fallacies_examples_4_3":
              "\'It\'s obvious – 9/11 was an American-government led conspiracy to justify the war in Iraq and Afghanistan. No plane hit the Pentagon. The Twin Towers collapse was a controlled demolition… etc.\'",
          "fallacies_examples_4_4":
              "\'We\'re going to have to cut the education budget or go deeper into debt. We can\'t afford to go deeper into debt, so we\'ll have to cut the education budget.\'",
          "fallacies_examples_4_5":
              "\'I did not have sexual relations with that woman.\'",
          "fallacies_examples_4_6":
              "\'After legalizing gay marriage, school libraries were required to stock same-sex literature; primary school children were given homosexual fairy tales and even manuals of explicit homosexual advocacy.\'",
          "fallacies_examples_4_7":
              "\'Why should the senator account for irregularities in his expenses? After all, there are senators who have done far worse things.\'",
          "fallacies_examples_4_8":
              "\'If we legalize marijuana, more people will start using crack and heroin, then we\'d have to legalize those too.\'",
          "fallacies_examples_4_9":
              "\'This Iraqi regime possesses and produces chemical and biological weapons. It is seeking nuclear weapons.\'",
          "fallacies_examples_4_10":
              "\'He lied because he\'s possessed by demons.\'",
          "fallacies_titles_5_0": "Ad Hominem",
          "fallacies_titles_5_1": "Burden of Proof",
          "fallacies_titles_5_2": "Circumstantial Ad Hominem",
          "fallacies_titles_5_3": "Genetic Fallacy",
          "fallacies_titles_5_4": "Guilt by Association",
          "fallacies_titles_5_5": "Straw Man",
          "fallacies_descs_5_0":
              "Bypassing the argument by launching an irrelevant attack on the person rather than their claim.",
          "fallacies_descs_5_1":
              "I don\'t need to prove my claim - you must prove it is false.",
          "fallacies_descs_5_2":
              "Stating a claim isn\'t credible only because of the advocate\'s interest in their claim.",
          "fallacies_descs_5_3":
              "Attacking the cause or origin of a claim, rather than it\'s substance.",
          "fallacies_descs_5_4":
              "Discrediting an idea or claim by associating it with an undesirable person or group.",
          "fallacies_descs_5_5":
              "Creating a distorted or simplified caricature of your opponent\'s argument, and the arguing against that.",
          "fallacies_examples_5_0":
              "\'Anyone that says we should build the Ground Zero Mosque is an American-hating liberal.\'",
          "fallacies_examples_5_1":
              "\'I maintain long-term solar cycles are the cause of global warming. Show me I\'m wrong.\'",
          "fallacies_examples_5_2":
              "\'A study into the health risks of mobile phones involved mobile phone companies, therefore the study cannot be trusted.\'",
          "fallacies_examples_5_3":
              "\'Of course, mainstream liberal media aren\'t going to say Barack Obama is a Muslim.\'",
          "fallacies_examples_5_4":
              "\'Oh you want to relax the anti-terrorism laws just like the terrorists want us to do. Are you saying you support terrorism?\'",
          "fallacies_examples_5_5":
              "\'You say Israel should stop building settlements on the West Bank in violation of the treaty, so you\'re saying Israel doesn\'t have the right to be a nation?\'"
        },
      };
}
