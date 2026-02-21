import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:agrodetect_app/localization/app_localizations.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/primary_button.dart';
import '../providers/profile_provider.dart';

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(LocaleNotifier.new);

class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() => const Locale('en'); // Default english
  void updateLocale(Locale locale) => state = locale;
}

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _nameController = TextEditingController();
  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileProvider).profile;
    if (profile != null) {
      _nameController.text = profile.name;
      _selectedLanguage = profile.language == 'hi' ? 'hi' : 'en';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isLoading = ref.watch(profileProvider).isLoading;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.profile,
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: l10n.name,
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              initialValue: _selectedLanguage,
              decoration: InputDecoration(
                labelText: l10n.changeLanguage,
                prefixIcon: const Icon(Icons.language),
              ),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'hi', child: Text('Hindi')),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selectedLanguage = val);
                }
              },
            ),
            const SizedBox(height: 48),
            PrimaryButton(
              text: 'Save Changes',
              isLoading: isLoading,
              onPressed: () async {
                ref.read(localeProvider.notifier).updateLocale(Locale(_selectedLanguage));
                await ref.read(profileProvider.notifier).updateProfile(
                      name: _nameController.text,
                      language: _selectedLanguage,
                    );
                if (context.mounted) context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
