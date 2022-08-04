part of 'package:test_impact/activity/activity.dart';

class AddActivityPage extends StatelessWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddActivityBloc>(
      create: (context) => AddActivityBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          centerTitle: true,
          title: Text(
            'New Activity',
            style: AppStyle.textSubTitleWhite,
          ),
        ),
        body: const _AddActivityBody(),
      ),
    );
  }
}

class _AddActivityBody extends StatelessWidget {
  const _AddActivityBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ActivityDropdown(),
          _InstitutionInput(),
          _DatePicker(),
          _ObjectiveInput(),
          _RemarksInput(),
          SizedBox(height: 0.1.sh),
          Center(
            child: SizedBox(
              width: 0.8.sw,
              child: ElevatedButton(
                onPressed: () {},
                clipBehavior: Clip.antiAlias,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: const StadiumBorder(),
                  primary: Colors.cyan,
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: AppStyle.textSubTitleWhite,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 0.02.sh),
        ],
      ),
    );
  }
}

class _ActivityDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddActivityBloc, AddActivityState>(
      buildWhen: (previous, current) =>
          previous.activityType != current.activityType,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'what do you want to do?',
                style: AppStyle.textBody,
              ),
            ),
            Card(
              color: Colors.grey[350],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 0.06.sh,
                width: 0.9.sw,
                child: TextField(
                  onChanged: (val) => context
                      .read<AddActivityBloc>()
                      .add(ActivityTypeChanged(val)),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _InstitutionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddActivityBloc, AddActivityState>(
      buildWhen: (previous, current) =>
          previous.institution != current.institution,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'who do you want to meet/call ?',
                style: AppStyle.textBody,
              ),
            ),
            Card(
              color: Colors.grey[350],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 0.06.sh,
                width: 0.9.sw,
                child: TextField(
                  onChanged: (val) => context
                      .read<AddActivityBloc>()
                      .add(InstitutionChanged(val)),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddActivityBloc, AddActivityState>(
      buildWhen: (previous, current) => previous.when != current.when,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'when do you want to meet/call ?',
                style: AppStyle.textBody,
              ),
            ),
            SizedBox(
              height: 0.06.sh,
              width: 0.9.sw,
              child: ElevatedButton(
                onPressed: () {
                  ModalBottomSheet.show(
                    radiusCircle: 20.h,
                    context: context,
                    children: [
                      SizedBox(
                        height: 0.25.sh,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          maximumYear: 2022,
                          onDateTimeChanged: (value) {
                            context
                                .read<AddActivityBloc>()
                                .add(DateChanged(value));
                          },
                          initialDateTime: state.when ?? DateTime.now(),
                        ),
                      ),
                    ],
                  );
                },
                clipBehavior: Clip.antiAlias,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  shape: const StadiumBorder(),
                  primary: Colors.lightBlueAccent,
                ),
                child: Center(
                  child: Text(
                    DateFormat('dd MMM yyyy')
                        .format(state.when ?? DateTime.now()),
                    style: AppStyle.textSubTitleWhite,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ObjectiveInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddActivityBloc, AddActivityState>(
      buildWhen: (previous, current) => previous.objective != current.objective,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'when do you want to meet/call ?',
                style: AppStyle.textBody,
              ),
            ),
            Card(
              color: Colors.grey[350],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 0.06.sh,
                width: 0.9.sw,
                child: TextField(
                  onChanged: (val) => context
                      .read<AddActivityBloc>()
                      .add(ObjectiveChanged(val)),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _RemarksInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddActivityBloc, AddActivityState>(
      buildWhen: (previous, current) => previous.remarks != current.remarks,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'when do you want to meet/call ?',
                style: AppStyle.textBody,
              ),
            ),
            Card(
              color: Colors.grey[350],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 0.2.sh,
                width: 0.9.sw,
                child: TextField(
                  onChanged: (val) =>
                      context.read<AddActivityBloc>().add(RemarksChanged(val)),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
